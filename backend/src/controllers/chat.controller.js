import { ApiResponse } from '../utils/ApiResponse.js'
import { ChatModel } from "../models/chat.model.js";


const getAIResponse = async (req, res) => {
  try {
    if (!req.body || !req.body.prompt) {
      return res.status(400).json({ error: "Missing prompt in request body" });
    }

    const { conversationId, prompt } = req.body;

    const response = await fetch("https://openrouter.ai/api/v1/chat/completions", {
      method: "POST",
      headers: {
        "Authorization": `Bearer ${process.env.CHATBOT_API_KEY}`,
        "Content-Type": "application/json",
      },
      body: JSON.stringify({
        model: "mistralai/mistral-7b-instruct",
        messages: [{ role: "user", content: prompt }],
      }),
    });

    if (!response.ok) {
      const errorText = await response.text();
      throw new Error(`HTTP Error! Status: ${response.status}, Message: ${errorText}`);
    }

    const data = await response.json();
    const aiResponse = data.choices?.[0]?.message?.content || "No response received";

    await saveChatHistory(prompt, aiResponse);

    const allChats = await ChatModel.find();
    res.status(200).json(
      new ApiResponse(200 , allChats , "Response Recieved")
    );

  } catch (error) {
    console.error("Error Fetching AI Response:", error.message);
    res.status(500).json({ error: "Internal server error" });
  }
};

const saveChatHistory = async (userMessage, aiResponse) => {
  try {
    const chatEntry = await ChatModel.create({
      userMessage,
      aiResponse,
    });

    await chatEntry.save();
  } catch (error) {
    console.error("Error saving chat history:", error.message);
  }
};

const getAllChats = async (req, res) => {
  try {
    const allChats = await ChatModel.find();
    res.status(200).json(
      new ApiResponse(200 , allChats , "Response Recieved")
    );
  } catch (error) {
    console.log(error.message);
  }
}

export { getAIResponse , getAllChats };

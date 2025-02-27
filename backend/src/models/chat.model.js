import mongoose from "mongoose";
import { Schema } from "mongoose";

const chatSchema = new Schema(
  {
    // conversationId: {
    //   type: String, // Unique identifier for a conversation
    //   required: true,
    // },
    userMessage: {
      type: String,
      required: true,
    },
    aiResponse: {
      type: String,
      required: true,
    },
  },
  { timestamps: true } // ✅ Automatically adds `createdAt` and `updatedAt`
);

export const ChatModel = mongoose.model("Chat", chatSchema);



import mongoose from 'mongoose'

const connectDB = async ()=>{
  const connectionString = `${process.env.DATABASE_URL}/${process.env.DATABASE_NAME}`;
  try {
    const connectionInstance =await mongoose.connect(connectionString);
    console.log(`Mongodb connection succesful ${connectionInstance.connection.host}`);
  } catch (error) {
    console.error(`MONGODB Connection error : ${error}`);
    process.exit(1);
  }
}

export { connectDB }
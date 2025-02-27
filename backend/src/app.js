import express from 'express';
import dotenv from 'dotenv'
import cors from 'cors'

const app = express();

app.use(express.json());
app.use(express.static('public'));
app.use(cors());


import chatRouter from './routes/chat.route.js'

app.use('/api/v1/chat', chatRouter)

export { app }
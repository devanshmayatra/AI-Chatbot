import {app} from './app.js'
import { connectDB } from './db/db.js'

connectDB().then(()=>{
  app.listen(process.env.PORT || 8000 , "0.0.0.0" , ()=>{
    console.log(`Server is running on port ${process.env.PORT || 8000}`);
  })
  app.on('error',(error)=>{
    throw error;
  })
}).catch((error)=>{
  console.log(error);
})



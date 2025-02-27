import { Router } from 'express'
import { getAIResponse , getAllChats } from '../controllers/chat.controller.js';

const router = Router();

router.route('/get-response').post(getAIResponse)
router.route('/get-allchats').get(getAllChats)

export default router;
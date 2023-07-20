import { Router } from 'express'
const router = Router()

router.get('/', (req, res) => {
    try {
        res.send('hello from router')
    } catch (err) {
        res.send(err)
    }
})


export default router
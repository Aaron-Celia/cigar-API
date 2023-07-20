import express from 'express'
import morgan from 'morgan'
import router from '../routes'
const app = express()

app.use(express.json())
app.use(morgan('dev'))

app.get('/', (req, res) => {
    try {
        res.send('hello world')
    } catch (err) {
        res.send(err)
    }
})

app.use('/api/v1', router)

export default app
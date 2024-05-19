import consumer from "./consumer"

consumer.subscriptions.create("TaskChannel",{
    connected(){
        console.log("connected to the task channel")
    },
    disconnected(){
        console.log("disconnected from the task channel")
    },

    recieved(data){
        console.log("Recieved task:", data.task)
    }
})
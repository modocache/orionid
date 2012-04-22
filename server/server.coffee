Meteor.startup ->
    console.log 'Server start'
    if Chatrooms.find().count() is 0
        Chatrooms.insert
            name: 'Sample Chatroom'

    if Users.find().count() is 0
        Users.insert
            name: 'Patrick Bateman'

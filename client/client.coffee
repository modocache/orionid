Template.userView.users = () ->
    Users.find().fetch() # FIXME


Template.userLoginForm.events =
    'click #login-button': () ->
        console.log("Login!")


Template.chatroomView.selectedChatroom = () ->
    chatroom_id = Session.get('chatroom_id')
    Chatrooms.findOne(
        _id: chatroom_id
    )

Template.chatroomView.events =
    'click input': () ->
        console.log('Click')


Template.chatroomsList.chatrooms = () ->
    Chatrooms.find({},
        sort:
            name: 1
    )


Template.chatroom.active = () ->
    return Session.get('chatroom_id') is @_id

Template.chatroom.events =
    'click #chatroom-enter': () ->
        if Chatrooms.findOne(@_id)
            Session.set('chatroom_id', @_id)

            # FIXME - Grab user object
            me = Users.findOne()
            # Remove user from other chats
            for chatroom in Chatrooms.find().fetch()
                Chatrooms.update(chatroom._id, {$pull: (users:me)})
            # Add user to new chat
            Chatrooms.update(@_id, {$addToSet: (users: me)})

@Chatrooms = new Meteor.Collection('chatrooms')
# {
#   name: 'Development Team Announcements',
#   users: [{user_id, name}]
# }

@Users  = new Meteor.Collection('users')
# {
#   name: 'Patrick Bateman',
# }

@Messages = new Meteor.Collection('messages')
# {
#   user: {user_id, name},
#   body: 'Do you like Huey Lewis and The News?'
# }

require_relative 'linked_list.rb'

#Creating blank linked list
list = LinkedList.new
puts "Creating empty list: "
p list.to_s

#Appending / Adding Elements to the list
puts "After adding/appending 5 elements: "
list.append("Node1")
list.append("Node2")
list.append("Node3")
list.append("Node4")
list.append("Node5")
p list.to_s
#Prepending a head node to the list
puts "Prepending a new head to the list: "
list.prepend("Head")
p list.to_s
#Size of the list
puts "Current size of the list: #{list.size}"
#Displaying the head of the list
puts "Head of the list: ( #{list.head.data} ) -> ( #{list.head.pointer.data} )"
#Returning only the tail of the list
puts "Tail of the list: ( #{list.tail.data} ) -> ( nil )"
#Returnes the Node at given index
puts "Node at index 2 is : ( #{list.at(2).data} ) -> ( #{list.at(2).pointer.data} )"
p list.at(2)
#Popping / Deleting the tail of the lsit
puts "Before popping the last node of the list"
p list.to_s
puts "After popping the last node of the list"
list.pop
p list.to_s
#Searching if the linked list contains given data
puts "Searching if the list contains Node3"
p list.contains?("Node3")
#Returning the index of the given data, if doesn't exist :nil
puts "Returning the index of Node2"
p list.find("Node2")
#Represents the linked list as an string.
puts "The list as an string"
p list.to_s
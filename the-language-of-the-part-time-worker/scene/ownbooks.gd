extends Node
var item_list = []
func add_item(name:String,price:float,description:String,page:int,reading:int):
	var item = {
		"name":name,
		"price":price,
		"description":description,
		"page":page,
		"reading":reading
	}
	item_list.append(item)
func get_item(index:int):
	return item_list[index]
func get_all_items():
	return item_list;
func readbook(index:int,num:int):
	if num + item_list[index].reading>=item_list[index].page:
		item_list[index].reading=item_list[index].page
	else :
		item_list[index].reading=num + item_list[index].reading

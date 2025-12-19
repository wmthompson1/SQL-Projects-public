WIP Inventory Process Flow




# WIP Inventory Process Flow

Use this process flow to move parts:

1. An employee creates
   a move request. Move requests can be created in the request in
   the [Move Request](Manually_Creating_a_Move_Request.md)
   window or in [Inventory
   Transaction Entry](Move_Requests_in_Inventory_Transaction_Entry.md). When the move request information is complete,
   the employee sets the move request status to Ready for Pickup.
2. The material handler
   consults the [Material Handler Queue](VMMATDISWhat.md)
   to see a list move requests. The material handler selects a move
   request that has a status of Ready for Pickup and[picks the parts up](Picking_Up_Materials.md). The status of the move request is updated
   to Picked Up. Move requests can also be [picked
   up in the Move Request window](Using_the_Move_Request_Window_to_Pick_Up_Move_Requests.md).
3. After the material handler
   [delivers the parts](Delivering_a_Move_Request.md),
   the material handler opens the Material Handler Queue and updates
   the status of the Move Request to Delivered. If the parts were
   delivered to a different location from the one specified on the
   move request, the material handler can indicate where the parts
   were delivered instead. After the move request is delivered, it
   is removed from the Material Handler Queue. Move requests can
   also be [delivered
   in the Move Request window](Using_the_Move_Request_Window_to_Deliver_Move_Requests.md).
4. After the parts are
   delivered, users can [view
   details of the delivery](Viewing_Move_Request_Delivery_Information.md) in the Move Request window.
# binary_search_trees.rb
build, balance, and traverse binary search trees in ruby

# Methods

| Method | Description |
|:-------|:------------|
|#build_array |takes an array of data and turns it into a balanced binary tree full of Node objects appropriately placed; returns level-0 root |
|#insert |accepts a value to add to the binary tree |
|#delete |accepts a value to remove from the binary tree |
|#find |accepts a value and returns the node with the given value |
|#level_order |returns an array of values or nodes, while traversing the tree in breadth-first level order |
|#inorder |returns an array of values with an order of: Left, Root, Right |
|#preorder |returns an array of values with an order of: Root, Left, Right |
|#postorder |returns an array of values with an order of: Left, Right, Root |
|#height |accepts a node and returns its height |
|#depth |accepts a node and returns its depth |
|#balanced? |checks if the tree is balanced |
|#rebalance! |rebalances an unbalanced tree |
|#pretty_print |accurately visualizes the binary tree |
|#inorder_arr |creates an ordered array of the binary tree |
|#leftmost_leaf |returns the leftmost leaf node of the binary tree |

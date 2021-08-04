require_relative "node.rb"

class Tree
  attr_accessor :root, :data
  def initialize(arr)
    @data = arr.sort.uniq
    @root = build_tree(data)
  end

  def build_tree(arr, istart = 0, iend = arr.length - 1)
    return nil if istart > iend
    mid = ( istart + iend ) / 2
    root = Node.new(arr[mid])

    root.left_child = build_tree(arr, istart, mid - 1)
    root.right_child = build_tree(arr, mid + 1, iend)
    
    return root
  end

  def level_order(return_nodes = false, root = @root)
    return if root === nil
    ordered_arr = []
    queue = []
    queue.append(root)
    
    while queue.length > 0
      node = queue.shift
      
      ordered_arr << node.data if return_nodes == false
      ordered_arr << node if return_nodes == true

      queue.append(node.left_child) if node.left_child != nil
      queue.append(node.right_child) if node.right_child != nil
    end
    return ordered_arr
  end

  def find(value)
    tree = level_order(true)
    
    for i in 0...tree.length - 1
      return tree[i] if tree[i].data == value
    end
    
    return nil
  end

  def insert(value, node = @root)
    return nil if value == node.data

    if value < node.data
      node.left_child.nil? ? node.left_child = Node.new(value) : insert(value, node.left_child)
    else
      node.right_child.nil? ? node.right_child = Node.new(value) : insert(value, node.right_child)
    end
  end
  
  def delete(value, node = @root)
    return node if node.nil?

    if value < node.data
      node.left_child = delete(value, node.left_child)
    elsif value > node.data
      node.right_child = delete(value, node.right_child)
    else
      
      # if node has one or zero children
      return node.right_child if node.left_child.nil?
      return node.left_child if node.right_child.nil?

      # if node has two children
      leftmost_node = leftmost_leaf(node.right_child)
      node.data = leftmost_node.data
      node.right = delete(leftmost_node.data, node.right_child)
    end
    return node
  end
  
  def inorder(node = @root)
    return if node.nil?

    inorder(node.left_child)
    print "#{node.data} "
    inorder(node.right_child)
  end
  
  def preorder(node = @root)
    return if node.nil?

    print "#{node.data} "
    preorder(node.left_child)
    preorder(node.right_child)
  end

  def postorder(node = @root)
    return if node.nil?

    postorder(node.left_child)
    postorder(node.right_child)
    print "#{node.data} "
  end

  def height(node = @root)
    unless node.nil? || node == @root
      node = (node.instance_of?(Node) ? find(node.data) : find(node))
    end

    return -1 if node.nil?

    [height(node.left_child), height(node.right_child)].max + 1
  end
  
  def depth(node = @root, parent = @root, edges = 0)
    return 0 if node == parent
    return -1 if parent.nil?

    if node < parent.data
      edges += 1
      depth(node, parent.left_child, edges)
    elsif node > parent.data
      edges += 1
      depth(node, parent.right_child, edges)
    else
      edges
    end
  end
  
  def balanced?(node = @root)
    return true if node.nil?

    left_height = height(node.left_child)
    right_height = height(node.right_child)

    return true if (left_height - right_height).abs <= 1 && balanced?(node.left_child) && balanced?(node.right_child)

    return false
  end
  
  def rebalance!
    self.data = inorder_arr
    self.root = build_tree(self.data)
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right_child, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right_child
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left_child, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left_child
  end

  private

  def leftmost_leaf(node)
    node = node.left_child until node.left_child.nil?

    return node
  end

  def inorder_arr(node = @root, arr = [])
    unless node.nil?
      inorder_arr(node.left_child, arr)
      arr << node.data
      inorder_arr(node.right_child, arr)
    end
    return arr
  end
end

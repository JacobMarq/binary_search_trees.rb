require_relative "binary_search_tree.rb"

class Driver
  def initialize
    arr = Array.new(15) { rand(1..100) }
    @tree = Tree.new(arr)
  end

  def execute(tree = @tree)
    tree.pretty_print

    puts tree.balanced? ? 'Binary Search Tree is balanced.' : 'Binary Search Tree is not balanced.'

    puts 'Level order: '
    puts tree.level_order

    puts 'Preorder: '
    puts tree.preorder

    puts 'Inorder: '
    puts tree.inorder

    puts 'Postorder: '
    puts tree.postorder

    7.times do
      n = rand(100..150)
      tree.insert(n)
      puts "Inserted #{n} to tree."
    end

    tree.pretty_print

    puts tree.balanced? ? 'Binary Search Tree is balanced.' : 'Binary Search Tree is not balanced.'

    puts 'Rebalancing tree...'
    tree.rebalance!

    tree.pretty_print

    puts tree.balanced? ? 'Binary Search Tree is balanced.' : 'Binary Search Tree is not balanced.'

    puts 'Level order: '
    puts tree.level_order

    puts 'Preorder: '
    puts tree.preorder

    puts 'Inorder: '
    puts tree.inorder

    puts 'Postorder: '
    puts tree.postorder
  end
end

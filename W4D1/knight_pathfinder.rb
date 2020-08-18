require "byebug"
require 'set'
require_relative './polytree_node.rb'
class KnightPathFinder

    def initialize(start_position)
        @start_position = start_position
        @root_node = PolyTreeNode.new(start_position)
        @considered_positions = Set.new
        @considered_positions.add(start_position)
        @grid = Array.new(8) {Array.new(8)}
        build_move_tree(start_position)
    end

    def self.valid_moves(pos)
        pos[0] >= 0 && pos[1] >= 0 &&
        pos[0] < 8 && pos[1] < 8
    end

    def new_move_positions(position)
        idx = 1
        idx2 = 2
        new_arr = []
        (0...4).each do |i|
            idx *= -1 if i == 2
            new_arr << [position[0]+idx, position[1]+idx2]
            idx2 *= -1
        end

        reverse_arr = []
        new_arr.each do |pos|
            reverse_arr << pos.reverse
        end

        all_possible_moves = new_arr + reverse_arr
        all_possible_moves = all_possible_moves.uniq.select do |pos| 
            KnightPathFinder.valid_moves(pos) && 
            !@considered_positions.include?(pos)
        end
        all_possible_moves.each do |position|
            @considered_positions.add(position)
        end
        all_possible_moves
    end

    require "byebug"
    def find_path(end_position)
        end_node = @root_node.bfs(end_position)
        node_path = trace_path_back(end_node)
        node_path.map {|node| node.value}
    end

    def build_move_tree(starting_position)
        queue = []
        # add root node to queue
        queue.unshift(@root_node)
        # iterative loop:
        until queue.empty?
            # shift node from the queue
            current_node = queue.shift
            # find neighbors of node (possible neighbors checked by nmp)
            neighbor_positions = new_move_positions(current_node.value)
            neighbor_positions.each do |position|
                # turn neighbors into nodes
                node = PolyTreeNode.new(position)
                # set neighbor nodes to children
                current_node.add_child(node)
                # set current node as the parent to the neighbor children
                node.parent = current_node
                # add nodes to queue
                queue.unshift(node)
            end
        end
        nil
    end

    require "byebug"
    def trace_path_back(node)
        path = []
        until node.value == @start_position
            path.unshift(node)
            node = node.parent
        end
        path.unshift(@root_node)
        path
    end
end

kpf = KnightPathFinder.new([0, 0])
p kpf.find_path([7, 6]) # => [[0, 0], [1, 2], [2, 4], [3, 6], [5, 5], [7, 6]]
p kpf.find_path([6, 2]) # => [[0, 0], [1, 2], [2, 0], [4, 1], [6, 2]]
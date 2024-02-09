const std = @import("std");

const Node = struct {
    x: i32,
    next: ?*Node = null,
};

pub fn add_last(node: *Node, x: i32) !void {
    var new_node = Node{
        .x = x,
        .next = null,
    };

    var c_node = node;

    while (c_node.next) |next| {
        c_node = next;
    }
    std.debug.print("{d}\n", .{c_node.x});

    c_node.next = &new_node;
}

pub fn display(node: *Node) !void {
    var c_node = node;

    std.debug.print("{d}\n", .{c_node.x});
    while (c_node.next) |next| {
        c_node = next;
        std.debug.print("{d}\n", .{c_node.x});
    }
}

pub fn main() !void {
    var head = Node{ .x = 9, .next = null };
    try add_last(&head, 10);
    try add_last(&head, 11);
    try add_last(&head, 12);
    try add_last(&head, 13);

    // try display(&head);
}

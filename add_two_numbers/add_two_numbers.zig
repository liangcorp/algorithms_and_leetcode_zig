const std = @import("std");

const Node = struct {
    x: i32,
    next: ?*Node = null,
};

pub fn add_last(head: *Node, x: i32) !void {
    var new_node = Node{
        .x = x,
        .next = null,
    };

    var node = head;

    while (node.next) |next| {
        std.debug.print("{d}\n", .{node.x});
        node.* = next.*;
    }

    node.next = &new_node;
}

pub fn display(head: *Node) !void {
    var node = head;

    std.debug.print("{d}\n", .{node.x});

    while (node.next) |next| {
        std.debug.print("{d}\n", .{next.x});
        node = next;
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

import Vapor
import HTTP

final class PostController: ResourceRepresentable {
    func index(request: Request) throws -> ResponseRepresentable {
        return try Post.all().makeNode().converted(to: JSON.self)
    }

    func create(request: Request) throws -> ResponseRepresentable {
        var post = try request.post()
        print(post)
        try post.save()
        return post
    }

    func show(request: Request, post: Post) throws -> ResponseRepresentable {
        return post
    }

    func delete(request: Request, post: Post) throws -> ResponseRepresentable {
        try post.delete()
        return JSON([:])
    }

    func clear(request: Request) throws -> ResponseRepresentable {
        try Post.query().delete()
        return JSON([])
    }

    func update(request: Request, post: Post) throws -> ResponseRepresentable {
        let new = try request.post()
        var post = post
        post.name = new.name
        try post.save()
        return post
    }

    func replace(request: Request, post: Post) throws -> ResponseRepresentable {
        try post.delete()
        return try create(request: request)
    }

    func makeResource() -> Resource<Post> {
        return Resource(
            index: index,
            store: create,
            show: show,
            replace: replace,
            modify: update,
            destroy: delete,
            clear: clear
        )
    }
}

extension Request {
    func post() throws -> Post {
        print(json)
        guard let json = json else { throw Abort.badRequest }
        return try Post(node: json)
    }
}


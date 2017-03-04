import Vapor
import VaporMySQL
import HTTP


let drop = Droplet(
    preparations: [Post.self], 
    providers: [VaporMySQL.Provider.self]
)

drop.get { req in
    return try drop.view.make("welcome", [
    	"message": drop.localization[req.lang, "welcome", "title"]
    ])
}

drop.resource("posts", PostController())

drop.run()

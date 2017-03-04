import Vapor
import VaporMustache
import VaporMySQL
import HTTP


let drop = Droplet(providers: [VaporMustache.Provider.self, VaporMySQL.Provider.self])

drop.get("/hello") { _ in
  return "Hello Vapor"
}

drop.run()

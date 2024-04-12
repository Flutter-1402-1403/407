const database = new (require("sqlite3").verbose()).Database("database.db");

require("node:http").createServer({}, (request, response) => {
  const url = new URL(request.url, "http://127.0.0.1");
  if (request.method.toLowerCase() === "post") {
    if(url.pathname === "/api/login"){
      let body = "";
      request.on("data", (chunk) => {
          body += chunk;
      });
      request.once("end", () => {
        try {
          const data = JSON.parse(body);
          if (typeof data.username === "string" && typeof data.password === "string") {
            const statement = database.prepare("SELECT `name`, `password` FROM `users` WHERE `email` = $username OR `phone` = $username");
            statement.get({$username: data.username}, (error, result) => {
              if (error) {
                response.statusCode = 404;
                response.end();
              } else {
                if (result != null && result.password === data.password) {
                  const content = JSON.stringify({name: result.name});
                  response.writeHead(200, {
                    "content-length": content.length,
                    "content-type": "application/json; charset=UTF-8"
                  });
                  response.end(content);
                } else {
                  response.statusCode = 404;
                  response.end();
                }
              }
            });
            statement.finalize();
          } else {
            throw "Bad Request";
          }
        } catch {
          response.statusCode = 400;
          response.end();
        }
      });
    } else if(url.pathname === "/api/register"){
      let body = "";
      request.on("data", (chunk) => {
          body += chunk;
      });
      request.once("end", () => {
        try {
          const data = JSON.parse(body);
          if (typeof data.name === "string" /*&& /^(?=.*[a-zA-Z])(?=.*\d)(?=.*\w).{8,}$/.test(data.email) && /^09\d{9}$/.test(data.phone)*/ && typeof data.password === "string") {
            const statement = database.prepare("INSERT INTO `users` (`name`, `email`, `phone`, `password`) VALUES (?, ?, ?, ?)");
            statement.run([data.name, data.email, data.phone, data.password], (error) => {
              if (error) {
                response.statusCode = 409;
                response.end();
              } else {
                response.statusCode = 200;
                response.end();
              }
            });
            statement.finalize();
          } else {
            throw "Bad Request";
          }
        } catch {
          response.statusCode = 400;
          response.end();
        }
      });
    } else {
      response.statusCode = 404;
      response.end();
    }
  } else {
    response.statusCode = 405;
    response.end();
  }
}).listen(80);
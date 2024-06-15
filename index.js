import { nanoid } from 'nanoid';
import { hash } from 'argon2';
import { createConnection } from 'mariadb';
import { createServer } from "node:http";

console.log("Server Satate: Connecting to the database.");

const database = await createConnection({
  host: "127.0.0.1",
  port: 3306,
  user: "root",
  password: "",
  database: "imdb"
})
.catch(() => {
  throw new Error("Failed connection to the database.");
});
const token_statement = await database.prepare("INSERT INTO `tokens` (`token`, `user`) VALUES (?, ?)")
.catch(error => {
  throw new Error("Failed connection to the database.");
});
const register_statement = await database.prepare("INSERT INTO `users` (`name`, `email`, `username`, `password`) VALUES (?, ?, ?, ?)")
.catch(() => {
  throw new Error("Failed connection to the database.");
});
const change_name_statement = await database.prepare("UPDATE `users` SET `name` = ? WHERE `id` = ?")
.catch(() => {
  throw new Error("Failed connection to the database.");
});
const change_email_statement = await database.prepare("UPDATE `users` SET `email` = ? WHERE `id` = ?")
.catch(() => {
  throw new Error("Failed connection to the database.");
});
const change_username_statement = await database.prepare("UPDATE `users` SET `username` = ? WHERE `id` = ?")
.catch(() => {
  throw new Error("Failed connection to the database.");
});
const change_password_statement = await database.prepare("UPDATE `users` SET `password` = ? WHERE `id` = ?")
.catch(() => {
  throw new Error("Failed connection to the database.");
});
const send_comment_statement = await database.prepare("INSERT INTO `comments` (`author`, `movie`, `time`, `content`) VALUES (?, ?, ?, ?)")
.catch(() => {
  throw new Error("Failed connection to the database.");
});
const send_comment_rate_statement = await database.prepare("INSERT INTO `rates` (`user`, `movie`, `rate`) VALUES (?, ?, 5) ON DUPLICATE KEY UPDATE `rate` = `rate`")
.catch(() => {
  throw new Error("Failed connection to the database.");
});
const send_rate_statement = await database.prepare("INSERT INTO `rates` (`user`, `movie`, `rate`) VALUES (?, ?, ?) ON DUPLICATE KEY UPDATE `rate` = ?")
.catch(() => {
  throw new Error("Failed connection to the database.");
});
const logout_statement = await database.prepare("DELETE FROM `tokens` WHERE `token` = ?")
.catch(() => {
  throw new Error("Failed connection to the database.");
});
const add_favorite_statement = await database.prepare("INSERT INTO `favorites` (`user`, `movie`) VALUES (?, ?)")
.catch(() => {
  throw new Error("Failed connection to the database.");
});
const remove_favorite_statement = await database.prepare("DELETE FROM `favorites` WHERE `user` = ? AND `movie` = ?")
.catch(() => {
  throw new Error("Failed connection to the database.");
});

console.log("Server Satate: Setting up the server.");

createServer({}, (request, response) => {
  const url = new URL(request.url, "http://127.0.0.1");
  const method = request.method.toLocaleUpperCase();
  if (method === "GET") {
    if (url.pathname === "api/favorites"){
      database.query("SELECT `users`.`id` FROM `tokens`, `users` WHERE `tokens`.`token` = ? AND `users`.`id` = `tokens`.`user`", [request.headers.authorization])
      .then(async result => {
        if (result[0]) {
          database.query("SELECT `movies`.`id`, `movies`.`title`, `movies`.`avatar` FROM `favorites`, `movies` WHERE `favorites`.`user` = ? AND `movies`.`id` = `favorites`.`movie`", [result[0]])
          .then(async favorites => {
            if (result[0]) {
              const content = JSON.stringify(favorites ?? []);
              response.writeHead(200, {
                "content-length": content.length,
                "content-type": "application/json; charset=UTF-8"
              });
              response.end(content);
            } else {
              response.statusCode = 401;
              response.end();
            }
          });
          const content = JSON.stringify({name: result[0].name});
          response.writeHead(200, {
            "content-length": content.length,
            "content-type": "application/json; charset=UTF-8"
          });
          response.end(content);
        } else {
          response.statusCode = 401;
          response.end();
        }
      })
      .catch(() => {
        response.statusCode = 500;
        response.end();
      });
    } else if (url.pathname === "/api/top_week"){
      database.query("SELECT `movies`.`id`, `movies`.`title`, `movies`.`description`, `thumbnails`.`url` FROM `movies`, `thumbnails`, `top_week` WHERE `movies`.`id` = `top_week`.`movie` AND `thumbnails`.`movie` = `movies`.`id` ORDER BY `movies`.`rank` ASC")
      .then(async result => {
        if (result[0]) {
          const content = JSON.stringify(result);
          response.writeHead(200, {
            "content-length": content.length,
            "content-type": "application/json; charset=UTF-8"
          });
          response.end(content);
        } else {
          response.statusCode = 404;
          response.end();
        }
      })
      .catch(() => {
        response.statusCode = 500;
        response.end();
      });
    } else if (url.pathname === "/api/best_movie"){
      database.query("SELECT `id`, `title`, `rate` AS `imdb_rate`, `avatar` FROM `movies` WHERE `rank` = 1")
      .then(async result => {
        if (result[0]) {
          const content = JSON.stringify(result[0]);
          response.writeHead(200, {
            "content-length": content.length,
            "content-type": "application/json; charset=UTF-8"
          });
          response.end(content);
        } else {
          response.statusCode = 404;
          response.end();
        }
      })
      .catch(() => {
        response.statusCode = 500;
        response.end();
      });
    } else if (url.pathname === "/api/top_movies"){
      database.query("SELECT `id`, `title`, `avatar` FROM `movies` ORDER BY `rank` ASC LIMIT 10")
      .then(async result => {
        if (result[0]) {
          const content = JSON.stringify(result);
          response.writeHead(200, {
            "content-length": content.length,
            "content-type": "application/json; charset=UTF-8"
          });
          response.end(content);
        } else {
          response.statusCode = 404;
          response.end();
        }
      })
      .catch(() => {
        response.statusCode = 500;
        response.end();
      });
    } else if (url.pathname === "/api/movies") {
      let filter = [];
      let values = [];
      const title = url.searchParams.get("title");
      const year = Number(url.searchParams.get("year"));
      const genre = url.searchParams.get("genre")?.toLowerCase();
      if (title?.length > 0) {
        filter.push("CHARINDEX(?, `movies`.`title`) > 0");
        values.push(title);
      }
      if (year > 0) {
        filter.push("`movies`.`year` = ?");
        values.push(year);
      }
      if (title?.length > 0) {
        filter.push("`genres`.`genre` = ? AND `movies`.`id` = `genres`.`movie`");
        values.push(genre);
      }
      filter.join(" AND ");
      if (filter.length > 0) {
        filter = `WHERE ${filter}`;
      }
      database.query("SELECT `movies`.`id`, `movies`.`title`, `movies`.`avatar`, `movies`.`year`, `movies`.`rate` AS `imdb_rate` FROM `movies`, `genres` " + filter + " ORDER BY `movies`.`rank` LIMIT 100", values)
      .then(async result => {
        if (result[0]) {
          const content = JSON.stringify(result);
          response.writeHead(200, {
            "content-length": content.length,
            "content-type": "application/json; charset=UTF-8"
          });
          response.end(content);
        } else {
          response.statusCode = 404;
          response.end();
        }
      })
      .catch(() => {
        response.statusCode = 500;
        response.end();
      });
    } else if (/^\/api\/movies\/.+?$/.test(url.pathname)) {
      const movie = url.pathname.match(/(?<=^\/api\/movies\/).+?$/g);
      Promise.all(database.query("SELECT `movies`.`title`, `movies`.`description`, `movies`.`avatar`, `movies`.`year`, `movies`.`length`, `movies`.`rate` AS `imdb_rate`, AVG(`rates`.`rate`) AS `rate`, `movies`.`rank`, `movies`.`director`, `movies`.`actors` FROM `movies`, `rates` WHERE `movies`.`id` = ? AND `rates`.`movie` = `movies`.`id` GROUP BY `rates`.`movie`", [movie]), database.query("SELECT `url` FROM `thumbnails` WHERE `thumbnails`.`movie` = ?", [movie]), database.query("SELECT `genre` FROM `genres` WHERE `movie` = ?", [movie]))
      .then(async result => {
        if (result[0][0]) {
          const content = JSON.stringify({...result[0][0], thumbnails: result[1].map((value) => value.url), genres: result[2].map((value) => value.genre)});
          response.writeHead(200, {
            "content-length": content.length,
            "content-type": "application/json; charset=UTF-8"
          });
          response.end(content);
        } else {
          response.statusCode = 404;
          response.end();
        }
      })
      .catch(() => {
        response.statusCode = 500;
        response.end();
      });
    } else if (/^\/api\/movies\/.+?\/comments$/.test(url.pathname)) {
      //todo: validate movie
      database.query("SELECT `users`.`name` AS `author`, `comments`.`time`, `comments`.`content`, `rates`.`rate` FROM `users`, `comments`, `rates` WHERE `users`.`id` = `comments`.`author` AND `comments`.`movie` = ? AND `rates`.`user` = `comments`.`author` AND `rates`.`movie` = `comments`.`movie`", [url.pathname.match(/(?<=^\/api\/movies\/).+?(?=\/comments$)/g)])
      .then(async result => {
          const content = JSON.stringify(result);
          response.writeHead(200, {
            "content-length": content.length,
            "content-type": "application/json; charset=UTF-8"
          });
          response.end(content);
      })
      .catch(() => {
        response.statusCode = 500;
        response.end();
      });
    } else if (/^\/api\/movies\/.+?\/rate$/.test(url.pathname)) {
      //todo: validate movie
      const movie = url.searchParams.get("movie");
      if (rate && rate >= 0 && rate <= 10) {
        database.query("SELECT `users`.`id` FROM `tokens`, `users` WHERE `tokens`.`token` = ? AND `users`.`id` = `tokens`.`user`", [request.headers.authorization])
        .then(result => {
          if (result[0]) {
            database.query("SELECT `rate` FROM `rates` WHERE `user` = ? AND `movie` = ?", [result[0], movie])
            .then(result => {
              if (result[0]) {
                const content = JSON.stringify(result);
                response.writeHead(200, {
                  "content-length": content.length,
                  "content-type": "application/json; charset=UTF-8"
                });
                response.end(content);
              } else {
                response.statusCode = 404;
                response.end();
              }
            });
          } else {
            response.statusCode = 401;
            response.end();
          }
        })
        .catch(() => {
          response.statusCode = 500;
          response.end();
        });
      } else {
        response.statusCode = 400;
        response.end();
      }
    } else {
      response.statusCode = 404;
      response.end();
    }
  } else if (method === "POST") {
    if (url.pathname === "/api/auth"){
      database.query("SELECT `users`.`name`, `users`.`username`, `users`.`email` FROM `tokens`, `users` WHERE `tokens`.`token` = ? AND `users`.`id` = `tokens`.`user`", [request.headers.authorization])
      .then(async result => {
        if (result[0]) {
          const content = JSON.stringify({name: result[0].name});
          response.writeHead(200, {
            "content-length": content.length,
            "content-type": "application/json; charset=UTF-8"
          });
          response.end(content);
        } else {
          response.statusCode = 401;
          response.end();
        }
      })
      .catch(() => {
        response.statusCode = 500;
        response.end();
      });
    } else if (url.pathname === "/api/login"){
        const username = url.searchParams.get("username");
        const password = url.searchParams.get("password");
        if (typeof username === "string" && password === "string") {
          hash(password)
          .then(hashed_password => {
            database.query("SELECT `name`, `username`, `email` FROM `users` WHERE (`email` = ? OR `username` = ?) AND `password` = ? LIMIT 1", [username, username, hashed_password])
            .then(async result => {
              if (result[0]) {
                let token;
                let keep = true;
                while (keep) {
                  token = nanoid(255);
                  await token_statement.execute([token, result[0].id])
                  .then(() => {
                    keep = false;
                  })
                  .catch(error => {
                    if (error.errno !== 1062) {
                      throw error;
                    }
                  });
                }
                const content = JSON.stringify({token, ...result[0]});
                response.writeHead(200, {
                  "content-length": content.length,
                  "content-type": "application/json; charset=UTF-8"
                });
                response.end(content);
              } else {
                response.statusCode = 401;
                response.end();
              }
            });
          })
          .catch(() => {
            response.statusCode = 500;
            response.end();
          });
        } else {
          response.statusCode = 400;
          response.end();
        }
    } else if (url.pathname === "/api/register") {
      const name = url.searchParams.get("name");
      const email = url.searchParams.get("email");
      const username = url.searchParams.get("username");
      const password = url.searchParams.get("password");
      if (typeof name === "string" && /^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/.test(email) && /^(?=.{3,20}$)(?![\d_])(?!.*_{2})[\d\w]+(?<![\d_])$/.test(username) && typeof password === "string") {
        hash(password)
        .then(hashed_password => {
          register_statement.execute([name, email, username, hashed_password])
          .then(() => {
            database.query("SELECT `id` FROM `users` WHERE `email` = ?", [email])
            .then(async result => {
              if (result[0]) {
                let token;
                let keep = true;
                while (keep) {
                  token = nanoid(255);
                  await token_statement.execute([token, user])
                  .then(() => {
                    keep = false;
                  })
                  .catch(error => {
                    if (error.errno !== 1062) {
                      throw error;
                    }
                  });
                }
                const content = JSON.stringify({token});
                response.writeHead(200, {
                  "content-length": content.length,
                  "content-type": "application/json; charset=UTF-8"
                });
                response.end(content);
              } else {
                response.statusCode = 500;
                response.end();
              }
            });
          })
          .catch(error => {
            if (error.errno === 1062) {
              response.statusCode = 409;
              response.end();
            } else {
              throw error;
            }
          });
        })
        .catch(() => {
          response.statusCode = 500;
          response.end();
        });
      } else {
        response.statusCode = 400;
        response.end();
      }
    } else if(/^\/api\/favorites\/.+$/.test(url.pathname)) {
      //todo: validate movie
      database.query("SELECT `users`.`id` FROM `tokens`, `users` WHERE `tokens`.`token` = ? AND `users`.`id` = `tokens`.`user`", [request.headers.authorization])
      .then(result => {
        if (result[0]) {
          add_favorite_statement.execute([result[0], url.searchParams.get("movie")])
          .then(() => {
            response.statusCode = 200;
            response.end();
          })
          .catch(error => {
            if (error.errno === 1062) {
              response.statusCode = 409;
              response.end();
            } else {
              throw error;
            }
          });
        } else {
          response.statusCode = 401;
          response.end();
        }
      })
      .catch(() => {
        response.statusCode = 500;
        response.end();
      });
    } else if (/^\/api\/movies\/.+?\/comments$/.test(url.pathname)) {
      //todo: validate movie
      const movie = url.searchParams.get("movie");
      const content = url.searchParams.get("content");
      if (content?.length > 0) {
        database.query("SELECT `users`.`id` FROM `tokens`, `users` WHERE `tokens`.`token` = ? AND `users`.`id` = `tokens`.`user`", [request.headers.authorization])
        .then(result => {
          if (result[0]) {
            Promise.all(send_comment_statement.execute([result[0], movie, Date.now(), content]), send_comment_rate_statement.execute(result[0], movie))
            .then(() => {
              response.statusCode = 200;
              response.end();
            });
          } else {
            response.statusCode = 401;
            response.end();
          }
        })
        .catch(() => {
          response.statusCode = 500;
          response.end();
        });
      } else {
        response.statusCode = 400;
        response.end();
      }
    } else if (/^\/api\/movies\/.+?\/rate$/.test(url.pathname)) {
      //todo: validate movie
      const movie = url.searchParams.get("movie");
      const rate = Number(url.searchParams.get("rate"));
      if (rate && rate >= 0 && rate <= 10) {
        database.query("SELECT `users`.`id` FROM `tokens`, `users` WHERE `tokens`.`token` = ? AND `users`.`id` = `tokens`.`user`", [request.headers.authorization])
        .then(result => {
          if (result[0]) {
            send_rate_statement.execute([result[0], movie, rate, rate])
            .then(() => {
              response.statusCode = 200;
              response.end();
            });
          } else {
            response.statusCode = 401;
            response.end();
          }
        })
        .catch(() => {
          response.statusCode = 500;
          response.end();
        });
      } else {
        response.statusCode = 400;
        response.end();
      }
    } else {
      response.statusCode = 404;
      response.end();
    }
  } else if (method === "PATCH") {
    if(url.pathname === "/api/change_name"){
      const name = url.searchParams.get("name");
      if (typeof name === "string") {
        database.query("SELECT `users`.`id` FROM `tokens`, `users` WHERE `tokens`.`token` = ? AND `users`.`id` = `tokens`.`user`", [request.headers.authorization])
        .then(result => {
          if (result[0]) {
            change_name_statement.execute([name, result[0]])
            .then(() => {
              response.statusCode = 200;
              response.end();
            });
          } else {
            response.statusCode = 401;
            response.end();
          }
        })
        .catch(() => {
          response.statusCode = 500;
          response.end();
        });
      } else {
        response.statusCode = 400;
        response.end();
      }
    } else if(url.pathname === "/api/change_email"){
      const email = url.searchParams.get("email");
      if (/^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/.test(email)) {
        database.query("SELECT `users`.`id` FROM `tokens`, `users` WHERE `tokens`.`token` = ? AND `users`.`id` = `tokens`.`user`", [request.headers.authorization])
        .then(result => {
          if (result[0]) {
            change_email_statement.execute([email, result[0]])
            .then(() => {
              response.statusCode = 200;
              response.end();
            });
          } else {
            response.statusCode = 401;
            response.end();
          }
        })
        .catch(() => {
          response.statusCode = 500;
          response.end();
        });
      } else {
        response.statusCode = 400;
        response.end();
      }
    } else if(url.pathname === "/api/change_username"){
      const username = url.searchParams.get("username");
      if (/^(?=.{3,20}$)(?![\d_])(?!.*_{2})[\d\w]+(?<![\d_])$/.test(username)) {
        database.query("SELECT `users`.`id` FROM `tokens`, `users` WHERE `tokens`.`token` = ? AND `users`.`id` = `tokens`.`user`", [request.headers.authorization])
        .then(result => {
          if (result[0]) {
            change_username_statement.execute([username, result[0]])
            .then(() => {
              response.statusCode = 200;
              response.end();
            });
          } else {
            response.statusCode = 401;
            response.end();
          }
        })
        .catch(() => {
          response.statusCode = 500;
          response.end();
        });
      } else {
        response.statusCode = 400;
        response.end();
      }
    } else if(url.pathname === "/api/change_password"){
      const old_password = url.searchParams.get("old_password");
      const new_password = url.searchParams.get("new_password");
      if (typeof old_password === "string" && typeof new_password === "string") {
        hash(old_password)
        .then(hashed_old_password => {
          database.query("SELECT `users`.`id` FROM `tokens`, `users` WHERE `tokens`.`token` = ? AND `users`.`id` = `tokens`.`user` AND `users`.`password` = ?", [request.headers.authorization, hashed_old_password])
          .then(result => {
            if (result[0]) {
              hash(new_password)
              .then(hashed_new_password => {
                change_password_statement.execute([hashed_new_password, result[0]])
                .then(() => {
                  response.statusCode = 200;
                  response.end();
                });
              });
            } else {
              response.statusCode = 401;
              response.end();
            }
          });
        })
        .catch(() => {
          response.statusCode = 500;
          response.end();
        });
      } else {
        response.statusCode = 400;
        response.end();
      }
    } else {
      response.statusCode = 404;
      response.end();
    }
  } else if (method === "DELETE") {
    if (url.pathname === "/api/logout") {
      database.query("SELECT 1 FROM `tokens` WHERE `token` = ?", [request.headers.authorization])
      .then(result => {
        if (result[0]) {
          logout_statement.execute([request.headers.authorization])
          .then(() => {
            response.statusCode = 200;
            response.end();
          });
        } else {
          response.statusCode = 401;
          response.end();
        }
      })
      .catch(() => {
        response.statusCode = 500;
        response.end();
      });
    } else if(/^\/api\/favorites\/.+$/.test(url.pathname)) {
      database.query("SELECT `users`.`id` FROM `tokens`, `users` WHERE `tokens`.`token` = ? AND `users`.`id` = `tokens`.`user`", [request.headers.authorization])
      .then(result => {
        if (result[0]) {
          remove_favorite_statement.execute([result[0], url.searchParams.get("movie")])
          .then(() => {
            response.statusCode = 200;
            response.end();
          });
        } else {
          response.statusCode = 401;
          response.end();
        }
      })
      .catch(() => {
        response.statusCode = 500;
        response.end();
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

console.log("Server Satate: Ready.");
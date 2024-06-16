# IMDb Project
A simple porject to fetch, save, and send IMDb data.

# Team Members
- PO: [Mohammad Mahdi Moghaddam](https://github.com/Moghaddm), [Arshia Harati](https://github.com/ArshiaHarati)
- PM: [Reza Emadi](https://github.com/captain-SRED)
- UI/UX: [Soheil Khanjani](https://github.com/defSoheil)
- Front-End: [Amir Mohammad Ghazanfari](https://github.com/amirchi007), [Nima Malakootikhah](https://github.com/Nima8FT)
- Back-End: [Amir Ali Mahmoudi](https://github.com/Dr-Bad)
- QA/QC: [Mohammad Reza Heydari](https://github.com/m20r05)

# Api List
Authorization: <token>
- [post]api/login((username | email) as username, password) => (token, name, username, email)
- [post]api/register(name, username, email, password) => (token)
- [post]api/auth(<token>) => (name, username, email)
- [patch]api/change_name(<token>, name) => (response code 200)
- [patch]api/change_username(<token>, username) => (response code 200)
- [patch]api/change_email(<token>, email) => (response code 200)
- [patch]api/change_password(<token>, old_password, new_password) => (response code 200)
- [delete]api/logout(<token>) => (response code 200)
- [get]api/favorites(<token>) => ((id, title, avatar)[])
- [delete]api/favorites/{movie}(<token>) => (response code 200)
- [post]api/favorites/{movie}(<token>) => (response code 200)
- [get]api/top_week => ((id, title, description, thumbnail)[])
- [get]api/best_movie => (id, title, genre[], imdb_rate, avatar)
- [get]api/top_movies => ((id, title, avatar)[])
- [get]api/movies(title?, year?, genre?) => ((id, title, avatar, year, imdb_rate)[])
- [get]api/movies/{movie} => (title, description, avatar, thumbnails[], genres[], year, duration, imdb_rate, rate, rank, director, actors)
- [get]api/movies/{movie}/rate(<token>) => (<float(1.0-10.0)>)
- [post]api/movies/{movie}/rate(<token>, rate<float(1.0-10.0)>) => (response code 200)
- [get]api/movies/{movie}/comments => ([author, rate, time, content])
- [post]api/movies/{movie}/comments(<token>, content) => (response code 200)
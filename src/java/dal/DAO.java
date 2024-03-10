package dal;

import java.sql.*;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import models.*;

/**
 *
 * @author thuat
 */
public class DAO {

    public static DAO INSTANCE = new DAO();
    private Connection con;
    private String status = "OK";

    private DAO() {
        if (INSTANCE == null) {
            con = new DBContext().connect;
        } else {
            INSTANCE = this;
        }
    }

    public static DAO getINSTANCE() {
        return INSTANCE;
    }

    public ArrayList<User> getUsers() {
        ArrayList<User> users = new ArrayList<>();
        try {
            System.out.println("Loading data...");
            String sql = "SELECT UserID, Name, Username, Password, Email, Role, Status FROM Userdb";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                User h = new User();
                h.setId(rs.getInt("UserID"));
                h.setName(rs.getString("Name"));
                h.setUsername(rs.getString("Username"));
                h.setEmail(rs.getString("Password"));
                h.setPassword(rs.getString("Email"));
                h.setRole(rs.getInt("Role"));
                h.setStatus(rs.getInt("Status"));
                users.add(h);
            }

        } catch (SQLException e) {
            status = "Error at read Users " + e.getMessage();
        }
        return users;
    }

    public ArrayList<Movie> topNewMovie() {
        ArrayList<Movie> movies = INSTANCE.getMovies();
        Collections.sort(movies, Comparator.comparing(Movie::getDate).reversed());

        return movies;
    }

    public ArrayList<Movie> comingSoonMovie() {
        ArrayList<Movie> movies = INSTANCE.getMovies();
        movies.removeIf(movie -> movie.getStatusrelease() != 0);
        // Filter movies based on date current
        //ZonedDateTime currentDateTime = ZonedDateTime.now();
        //movies.removeIf(movie -> movie.getDate().before(Date.from(currentDateTime.toInstant())));
        Collections.sort(movies, Comparator.comparing(Movie::getDate).reversed());

        return movies;
    }

    public ArrayList<Movie> topRateMovie() {
        ArrayList<Movie> movies = INSTANCE.getMovies();
        Collections.sort(movies, Comparator.comparing(Movie::getRate).reversed());

        return movies;
    }

    public void setRating(ArrayList<Movie> movies) {
        try {
            System.out.println("Loading data...");
            String sql = """
                         SELECT
                             M.MovieID,
                             M.Title AS MovieTitle,
                             AVG(UFM.Rate) AS AverageRating
                         FROM
                             Movie AS M
                         JOIN
                             UserFavoriteMovies AS UFM ON M.MovieID = UFM.MovieID
                         GROUP BY
                             M.MovieID, M.Title;""";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("MovieID");
                for (int i = 0; i < movies.size(); i++) {
                    Movie movie = movies.get(i);
                    if (movie.getId() == id) {
                        movie.setRate(rs.getInt("AverageRating"));
                    }
                }
            }

        } catch (SQLException e) {
            status = "Error at read Users " + e.getMessage();
        }
    }

    public Genre getGenrebyID(ArrayList<Genre> genres, int id) {
        Genre foundGenre = null;
        for (Genre genre : genres) {
            if (genre.getId() == id) {
                foundGenre = genre;
                break;
            }
        }
        return foundGenre;
    }

    public void setGenre(ArrayList<Movie> movies) {
        ArrayList<Genre> genres = INSTANCE.getGenres();
        for (int i = 0; i < movies.size(); i++) {
            ArrayList<Genre> genres_set = new ArrayList<>();
            movies.get(i).setGenre(genres_set);
        }
        try {
            System.out.println("Loading data...");
            String sql = """
                         SELECT
                             Movie.MovieID,
                             Genre.GenreID,
                             Genre.GenreName,
                             Genre.GenreColor
                         FROM
                             Movie
                         JOIN
                             MovieGenre ON Movie.MovieID = MovieGenre.MovieID
                         JOIN
                             Genre ON MovieGenre.GenreID = Genre.GenreID;""";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int movie_id = rs.getInt("MovieID");
                int genre_id = rs.getInt("GenreID");

                for (int i = 0; i < movies.size(); i++) {
                    Movie movie = movies.get(i);

                    if (movie.getId() == movie_id) {
                        for (int j = 0; j < genres.size(); j++) {
                            Genre genre = genres.get(j);
                            if (genre.getId() == genre_id) {
                                movies.get(i).getGenre().add(genre);
                            }
                        }
                    }
                }
            }

        } catch (SQLException e) {
            status = "Error at read Users " + e.getMessage();
        }
    }

    public ArrayList<Actor> getActorsbyMovie(int movie_id) {
        ArrayList<Actor> actors = new ArrayList<>();
        try {
            System.out.println("Loading data...");
            String sql = """
                         SELECT A.*
                         FROM Actor A
                         JOIN MovieActor MA ON A.ActorID = MA.ActorID
                         WHERE MA.MovieID = ?;""";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, movie_id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Actor h = new Actor();
                h.setId(rs.getInt("ActorID"));
                h.setName(rs.getString("ActorName"));
                h.setSrc(rs.getString("ActorImg"));
                h.setBirthday(rs.getDate("BirthDate"));
                h.setDescript(rs.getString("Description"));
                actors.add(h);
            }

        } catch (SQLException e) {
            status = "Error at read Genres " + e.getMessage();
        }
        return actors;
    }

    public ArrayList<Actor> getActors() {
        ArrayList<Actor> actors = new ArrayList<>();
        try {
            System.out.println("Loading data...");
            String sql = "select * from Actor";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Actor h = new Actor();
                h.setId(rs.getInt("ActorID"));
                h.setName(rs.getString("ActorName"));
                h.setSrc(rs.getString("ActorImg"));
                h.setBirthday(rs.getDate("BirthDate"));
                h.setDescript(rs.getString("Description"));
                actors.add(h);
            }

        } catch (SQLException e) {
            status = "Error at read Genres " + e.getMessage();
        }
        return actors;
    }

    public ArrayList<Genre> getGenresbyMovie(int id) {
        ArrayList<Genre> genres = new ArrayList<>();
        try {
            System.out.println("Loading data...");
            String sql = """
                         SELECT G.*
                         FROM Genre G
                         JOIN MovieGenre MG ON G.GenreID = MG.GenreID
                         WHERE MG.MovieID = ?;""";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Genre h = new Genre();
                h.setId(rs.getInt("GenreID"));
                h.setName(rs.getString("GenreName"));
                h.setColor(rs.getString("GenreColor"));
                genres.add(h);
            }

        } catch (SQLException e) {
            status = "Error at read Genres " + e.getMessage();
        }
        return genres;
    }

    public ArrayList<Genre> getGenres() {
        ArrayList<Genre> genres = new ArrayList<>();
        try {
            System.out.println("Loading data...");
            String sql = "select * from Genre";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Genre h = new Genre();
                h.setId(rs.getInt("GenreID"));
                h.setName(rs.getString("GenreName"));
                h.setColor(rs.getString("GenreColor"));
                genres.add(h);
            }

        } catch (SQLException e) {
            status = "Error at read Genres " + e.getMessage();
        }
        return genres;
    }

    public ArrayList<Movie> getMoviesbyGenre(String genre) {
        ArrayList<Movie> movies = new ArrayList<>();
        try {
            System.out.println("Loading data...");
            String sql = """
                         SELECT
                             M.MovieID,
                             M.Title AS MovieTitle,
                             M.ReleaseDate,
                             M.Description,
                             M.ThumbSource,
                             M.SourceLink,
                             M.TrailerLink,
                             M.Status AS MovieStatus,
                             M.StatusRelease,
                             (SELECT COUNT(1) FROM UserFavoriteMovies WHERE MovieID = M.MovieID AND isLove = 1) AS NumberOfLikes
                         FROM
                             Movie AS M
                         JOIN
                             MovieGenre AS MG ON M.MovieID = MG.MovieID
                         JOIN
                             Genre AS G ON MG.GenreID = G.GenreID
                         WHERE
                             G.GenreName = ?;""";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, genre);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Movie h = new Movie();
                h.setId(rs.getInt("MovieID"));
                h.setTitle(rs.getString("MovieTitle"));
                h.setDate(rs.getDate("ReleaseDate"));
                h.setDescript(rs.getString("Description"));
                h.setImg(rs.getString("ThumbSource"));
                h.setSrc(rs.getString("SourceLink"));
                h.setStatus(rs.getInt("MovieStatus"));
                h.setStatusrelease(rs.getInt("StatusRelease"));
                h.setLikecount(rs.getInt("NumberOfLikes"));
                movies.add(h);
            }
        } catch (SQLException e) {
            status = "Error at read Users " + e.getMessage();
        }
        setRating(movies);
        setGenre(movies);
        return movies;
    }

    public Movie getMovieByID(int id) {
        ArrayList<Movie> movies = INSTANCE.getMovies();
        Movie movie = null;
        for (Movie movy : movies) {
            if (movy.getId() == id) {
                movie = movy;
            }
        }
        return movie;
    }

    public ArrayList<Movie> getMovies() {
        ArrayList<Movie> movies = new ArrayList<>();
        try {
            System.out.println("Loading data...");
            String sql = """
                         SELECT
                             M.MovieID,
                             M.Title AS MovieTitle,
                             M.ReleaseDate,
                             M.Description,
                             M.ThumbSource,
                             M.SourceLink,
                             M.TrailerLink,
                             M.Status AS MovieStatus,
                             M.StatusRelease,
                             (SELECT COUNT(1) FROM UserFavoriteMovies WHERE MovieID = M.MovieID AND isLove = 1) AS NumberOfLikes
                         FROM
                             Movie AS M
                         JOIN
                             MovieGenre AS MG ON M.MovieID = MG.MovieID
                         JOIN
                             Genre AS G ON MG.GenreID = G.GenreID
                         GROUP BY
                             M.MovieID, M.Title, M.ReleaseDate, M.Description, M.ThumbSource, M.SourceLink, M.TrailerLink, M.Status, M.StatusRelease
                         HAVING
                             COUNT(M.MovieID) > 1;""";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Movie h = new Movie();
                h.setId(rs.getInt("MovieID"));
                h.setTitle(rs.getString("MovieTitle"));
                h.setDate(rs.getDate("ReleaseDate"));
                h.setDescript(rs.getString("Description"));
                h.setImg(rs.getString("ThumbSource"));
                h.setSrc(rs.getString("SourceLink"));
                h.setTrail(rs.getString("TrailerLink"));
                h.setStatus(rs.getInt("MovieStatus"));
                h.setStatusrelease(rs.getInt("StatusRelease"));
                h.setLikecount(rs.getInt("NumberOfLikes"));
                movies.add(h);
            }

        } catch (SQLException e) {
            status = "Error at read Users " + e.getMessage();
        }
        setRating(movies);
        setGenre(movies);
        return movies;
    }

    public User getUserbyId(int id) {
        ArrayList<User> users = getUsers();
        for (User user : users) {
            if (id == user.getId()) {
                return user;
            }
        }
        return null;
    }

    public User getUserbyEmailPassword(String email, String password) {
        ArrayList<User> users = getUsers();
        for (User user : users) {
            if (email.equals(user.getEmail()) && password.equals(user.getPassword())) {
                return user;
            }
        }
        return null;
    }

    public User getUserbyEmail(String email) {
        ArrayList<User> users = getUsers();
        for (User user : users) {
            if (email.equals(user.getEmail())) {
                return user;
            }
        }
        return null;
    }

    public void updateDB(String Name, String Username, String Password, String Email, int Role, int Status, int UserID) {

        System.out.println("Update data...");
        String sql = "UPDATE Userdb SET Name = ?, Username = ?, Password = ?, Email = ?, Role = ?, Status = ? WHERE UserID = ?;";

        try {
            PreparedStatement ps = con.prepareStatement(sql);

            // Set the new values and user ID
            ps.setString(1, Name);
            ps.setString(2, Username);
            ps.setString(3, Password);
            ps.setString(4, Email);
            ps.setInt(5, Role);
            ps.setInt(6, Status);
            ps.setInt(7, UserID);
            int rs = ps.executeUpdate();
            if (rs != 0) {
                System.out.println("update success");
            }
        } catch (SQLException e) {
            status = "Error at save Users " + e.getMessage();
        }
    }

    public void deleteFromDB(int userid) throws SQLException {
        String deleteFavoriteMoviesQuery = "DELETE FROM UserFavoriteMovies WHERE UserID = ?";
        try (PreparedStatement statement = con.prepareStatement(deleteFavoriteMoviesQuery)) {
            statement.setInt(1, userid);
            statement.executeUpdate();
        }


        // Xóa người dùng từ bảng Userdb
        String deleteUserQuery = "DELETE FROM Userdb WHERE UserID = ?";
        try (PreparedStatement statement = con.prepareStatement(deleteUserQuery)) {
            statement.setInt(1, userid);
            statement.executeUpdate();
        }
    }

    public boolean insert(String Name, String Username, String Password, String Email, int Role, int Status) {
        boolean check = false;

        System.out.println("Saving data...");
        String sql = "INSERT INTO Userdb (Name, Username, Password, Email, Role, Status) VALUES (?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, Name);
            ps.setString(2, Username);
            ps.setString(3, Email);
            ps.setString(4, Password);
            ps.setInt(5, Role);
            ps.setInt(6, Status);

            int rs = ps.executeUpdate();
            if (rs != 0) {
                System.out.println("add success");
                check = true;
            }
        } catch (SQLException e) {
            status = "Error at save Users " + e.getMessage();
        }
        return check;
    }

    public int getTotalUser() {
        String sql = "select count(*) from Userdb";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }

        } catch (SQLException e) {
            status = "Error at save Users " + e.getMessage();
        }
        return 0;
    }

    public ArrayList<User> pagingAccount(int index, int numPerPage) {
        ArrayList<User> list = new ArrayList<>();
        String sql = "SELECT * FROM Userdb ORDER BY UserID OFFSET ? ROWS FETCH NEXT ? ROWS ONLY;";
        try {
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, (index - 1) * numPerPage);
            ps.setInt(2, numPerPage);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(new User(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getInt(7)));
            }

        } catch (SQLException e) {
        }
        return list;
    }

    public void deleteListUser(String list_string) throws SQLException {
        list_string = list_string.trim();
        String[] list = list_string.split(",");
        for (String string : list) {
            try {
                int id = Integer.parseInt(string);
                INSTANCE.deleteFromDB(id);
            } catch (NumberFormatException e) {
            }
        }
    }

    public static void main(String[] args) throws SQLException {
        INSTANCE.deleteFromDB(5);

    }
}
package board.model;

import java.sql.Date;

import jsoup.MovieInfo;

public class BoardDataBean {
	private String boardid;
	private int boardnum;
	private String movieNm;
	private int moviescore;
	private String writer;
	private String email;
	private String subject;
	private String content;
	private int readcount;
	private Date reg_date;
	private String poster;
	private String story;

	public String getBoardid() {
		return boardid;
	}

	public void setBoardid(String boardid) {
		this.boardid = boardid;
	}

	public int getBoardnum() {
		return boardnum;
	}

	public void setBoardnum(int boardnum) {
		this.boardnum = boardnum;
	}

	public String getMovieNm() {
		return movieNm;
	}

	public void setMovieNm(String movieNm) {
		this.movieNm = movieNm;
	}

	public int getMoviescore() {
		return moviescore;
	}

	public void setMoviescore(int moviescore) {
		this.moviescore = moviescore;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

	public String getStory() {
		MovieInfo info = new MovieInfo();
		String url = info.story(movieNm);

		return url;
	}

	public void setStory(String story) {
		this.story = story;
	}

	public String getPoster() {
		MovieInfo info = new MovieInfo();
		String url = info.poster(movieNm);

		return url;
	}

	public void setPoster(String poster) {
		this.poster = poster;
	}

	@Override
	public String toString() {
		return "BoardDataBean [boardid=" + boardid + ", boardnum=" + boardnum + ", movieNm=" + movieNm + ", moviescore="
				+ moviescore + ", writer=" + writer + ", email=" + email + ", subject=" + subject + ", content="
				+ content + ", readcount=" + readcount + ", reg_date=" + reg_date + ", poster=" + poster + ", story="
				+ story + "]";
	}

}
package model.board;

import java.util.List;

public interface BoardService {
	public List<BoardVO> getBoardList(String text);
	public BoardVO getBoard(BoardVO vo);
	public void insertBoard(BoardVO vo);
	public void updateBoard(BoardVO vo);
	public void deleteBoard(BoardVO vo);
}

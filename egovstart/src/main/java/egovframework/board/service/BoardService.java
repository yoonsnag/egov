package egovframework.board.service;

import java.util.List;
import java.util.Map;

public interface BoardService {
	
	public int dataCount(Map<String, Object> map);
	
	public List<BoardDTO> listBoard(Map<String, Object> map);

}

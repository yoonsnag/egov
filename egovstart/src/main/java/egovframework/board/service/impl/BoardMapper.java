package egovframework.board.service.impl;

import java.util.List;
import java.util.Map;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egovframework.board.service.BoardDTO;

@Mapper("boardMapper")
public interface BoardMapper {

	public int dataCount(Map<String, Object> map);
	public List<BoardDTO> listBoard(Map<String, Object> map);
}

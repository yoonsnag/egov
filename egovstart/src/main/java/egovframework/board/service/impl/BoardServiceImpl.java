package egovframework.board.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import egovframework.board.service.BoardDTO;
import egovframework.board.service.BoardService;
import egovframework.example.sample.service.impl.EgovSampleServiceImpl;

@Service("boardService")
public class BoardServiceImpl extends EgovAbstractServiceImpl implements BoardService {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(EgovSampleServiceImpl.class);
	
	@Resource(name = "boardMapper")
	private BoardMapper mapper;

	@Override
	public int dataCount(Map<String, Object> map) {
		return mapper.dataCount(map);

	}
	
	@Override
	public List<BoardDTO> listBoard(Map<String, Object> map) {
		return mapper.listBoard(map);
		
	}
}

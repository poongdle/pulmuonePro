package curation.persistence;

import java.util.ArrayList;

import curation.domain.CurationDTO;

public interface CurationR {

	// 1. 큐레이션 시작
	ArrayList<CurationDTO> select() throws Exception;
}

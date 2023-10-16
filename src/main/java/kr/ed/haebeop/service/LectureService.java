package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.Lecture;
import org.springframework.stereotype.Service;

import java.util.List;


public interface LectureService {
    public List<Lecture> getLectureList();
    public Lecture getLecture(int no);
    public void cntUpLecture(int no);
    public List<Lecture> getSubjectLectureList(String subject);
}

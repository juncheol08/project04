package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.Lecture;
import kr.ed.haebeop.persistence.LectureMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LectureServiceImpl implements LectureService{

    @Autowired
    LectureMapper lectureMapper;

    @Override
    public List<Lecture> getLectureList() {
        return lectureMapper.getLectureList();
    }

    @Override
    public Lecture getLecture(int no) {
        return lectureMapper.getLecture(no);
    }

    @Override
    public void cntUpLecture(int no) {
        lectureMapper.cntUpLecture(no);
    }

    @Override
    public List<Lecture> getSubjectLectureList(String subject) {
        return lectureMapper.getSubjectLectureList(subject);
    }
}

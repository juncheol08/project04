package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.Instructor;
import kr.ed.haebeop.domain.Lecture;
import kr.ed.haebeop.domain.Notice;
import kr.ed.haebeop.domain.TeacherNotice;
import kr.ed.haebeop.persistence.InstructorMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class InstructorServiceImpl implements InstructorService{

    @Autowired
    InstructorMapper instructorMapper;

    @Override
    public List<Lecture> getTeacherLectureList(String teachername) {
        return instructorMapper.getTeacherLectureList(teachername);
    }

    @Override
    public List<TeacherNotice> getTeacherNoticeList(String teachername) {
        return instructorMapper.getTeacherNoticeList(teachername);
    }

    @Override
    public TeacherNotice getTeacherNoticeDetail(int no) {
        return instructorMapper.getTeacherNoticeDetail(no);
    }

    @Override
    public Instructor getTeacherId(String teachername) {
        return instructorMapper.getTeacherId(teachername);
    }
}

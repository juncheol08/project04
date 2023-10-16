package kr.ed.haebeop.service;


import kr.ed.haebeop.domain.Instructor;
import kr.ed.haebeop.domain.Lecture;
import kr.ed.haebeop.domain.Notice;
import kr.ed.haebeop.domain.TeacherNotice;

import java.util.List;

public interface InstructorService {
    public List<Lecture> getTeacherLectureList(String teachername);
    public List<TeacherNotice> getTeacherNoticeList(String teachername);
    public TeacherNotice getTeacherNoticeDetail(int no);
    public Instructor getTeacherId(String teachername);

}

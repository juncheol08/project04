package kr.ed.haebeop.persistence;

import kr.ed.haebeop.domain.Instructor;
import kr.ed.haebeop.domain.Lecture;
import kr.ed.haebeop.domain.TeacherNotice;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface InstructorMapper {

    //강의 리스트
    @Select("select * from lecture where teachername = #{teachername}")
    public List<Lecture> getTeacherLectureList(String teachername);

    //공지 목록
    @Select("select * from teachernotice where teachername=#{teachername}")
    public List<TeacherNotice> getTeacherNoticeList(String teachername);

    //공지 상세
    @Select("select * from teachernotice where no=#{no}")
    public TeacherNotice getTeacherNoticeDetail(int no);

    //teacher id
    @Select("select * from teacher where teachername=#{teachername}")
    public Instructor getTeacherId(String teachername);


    @Insert("insert into teacher(no,teacherid,teachername,category) values (default,#{teacherid},#{teachername},#{category})")
    public void teacherInsert(Instructor instructor);

    @Delete("delete from teacher where teacherid=#{teacherid}")
    public void teacherDelete(String teacherid);

    @Update("update teacher set teacherid=#{teacherid},teachername=#{teachername},category=#{category}")
    public void teacherUpdate(Instructor instructor);
}

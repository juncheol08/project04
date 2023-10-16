package kr.ed.haebeop.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Lecture {

    private int no;
    private String title;
    private String otvideo;
    private String samplevideo;
    private String teacherId;
    private String teachername;
    private String category;
    private int cnt;
    private int max_cnt;
    private int price;


}

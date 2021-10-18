package Pack;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;

@RestController
public class RESTcon {
    @RequestMapping("/reserveCHK")
    public HashMap<String, Object> reserveCHK(HttpServletRequest req, SearchBean searchBean, bookBean bB) {
        String bookId = req.getParameter("id");
        String userId = req.getParameter("userId");
        searchBean.setInput(bookId);
        searchBean.setStart("0");
        bB.setMember_mem_id(userId);
        bB.setB_id(bookId);
        FunDAO funDAO = new FunDAO();
        List<bookBean> res1 = null;
        List<bookBean> res2 = null;
        res1 = funDAO.select("IdSearch", searchBean);
        res2 = funDAO.select("beforeReserveCHK", bB);
        HashMap<String, Object> hashMap = new HashMap<>();
        hashMap.put("reserveCHK", res1);
        hashMap.put("beforeReserveCHK", res2);
        return hashMap;
    }

    @PostMapping("/reserveSuccess")
    public HashMap<String, Object> reserveSuccess(@RequestBody bookBean bB) {
        HashMap<String, Object> hashMap = new HashMap<>();
        FunDAO fundao = new FunDAO();
        fundao.insert("reserveInsert", bB);
        hashMap.put("result", bB);
        return hashMap;
    }

    @PostMapping("/rentREST")
    public HashMap<String, Object> rentREST(@RequestBody rentBean rb, FunDAO fundao) {
        System.out.println("rentREST 컨트롤러 콜");
        String mem_id = rb.getMember_mem_id();
        System.out.println(mem_id);
        fundao.insert("rentInsert", rb); //rent insert하기
        fundao.delete("rentReserveDelete", rb);

        HashMap<String, Object> hashMap = new HashMap<>();
        fundao.insert("reserveInsert", rb);
        hashMap.put("result", rb);
        return hashMap;
    }

}

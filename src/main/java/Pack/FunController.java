package Pack;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FunController {

    @RequestMapping(value = "/")
    public String home(){
        System.out.println("컨트롤러 콜");
        FunDAO funDAO = new FunDAO();
//        funDAO.insert();
        return "index";
    }

    @RequestMapping(value = "/tiger")
    public String tiger(){
        System.out.println("tiger 컨트롤러 콜");
        return "tiger";
    }
}

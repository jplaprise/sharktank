package hello;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.IOException;

@RestController
public class HelloController {

    @Autowired
    private WebBlockChain block;

    @RequestMapping("/")
    public String index() {



        try {
            System.out.println("this is the version : " + block.getClientVersion());
        } catch (IOException e) {
            e.printStackTrace();
        }

        return "Greetings from Spring Boot!";
    }
    
}

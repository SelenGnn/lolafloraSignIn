package users;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

public class Users {
    public static Map<String, String> users = new HashMap<>();

    public void setUser(String userKey) throws IOException, ParseException {
        JSONParser parser = new JSONParser();
        Object object = parser.parse(new FileReader("src/test/resources/configs/users.json"));
        JSONObject jsonObject = (JSONObject) object;
        JSONObject returnObject = (JSONObject) jsonObject.get(userKey);
        users.put("email", returnObject.get("email").toString());
        users.put("password", returnObject.get("password").toString());
    }

    public Boolean isContains(String key) {
        return users.containsKey(key);
    }

    public String getUserData(String key) {
        return users.get(key);
    }

}

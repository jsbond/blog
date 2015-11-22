package bizbee.utils;

import org.apache.commons.lang.StringUtils;

import java.util.ArrayList;
import java.util.List;

/**
 *
 */
public class SiteUtils {
    public static List<Long> getListOfElementsByCommaString(String stringToParse) {
        List<Long> result = new ArrayList<>();
        if (StringUtils.isNotBlank(stringToParse)) {
            final String[] ArrayOfElements = stringToParse.split(",");

            for (String role : ArrayOfElements) {
                result.add(Long.parseLong(role));
            }
        }
        return result;
    }
}

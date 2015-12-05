package bizbee.utils;

/**
 *
 */
public class Constants {
    static final ClassLoader loader = Constants.class.getClassLoader();

    public static final class PhotoStatus {
        public static final int DISABLED = 0;
        public static final int NEW = 1;
        public static final int TITLE = 2;
        public static final int PAGE_PHOTO = 3;
    }

    public static final class PageStatus {
        //choose it if you need sub category with series
        public static final int CHILD = 0;

        //choose it if you need a page, that havent series, only landing page
        public static final int SINGLE = 1;
    }

    public static final String PHOTO_DIRECTORY_TO = loader.getResource("../../static/img/base").getPath();
    public static final String PHOTO_DIRECTORY_FROM = loader.getResource("../../static/img/upload").getPath();
}

package bizbee.dao;

import bizbee.model.Page;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;


@Repository
public class PageDAO extends AbstractDAO<Page> {

    public PageDAO() {
        super(Page.class);
    }

    @Transactional
    public void persist(Page record) {
        manager.persist(record);
    }

    @Transactional
    public void merge(Page record) {
        manager.merge(record);
    }
}

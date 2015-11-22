package bizbee.dao;

import bizbee.model.Category;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.NoResultException;
import javax.persistence.Query;


@Repository
public class CategoryDAO extends AbstractDAO<Category> {

    public CategoryDAO() {
        super(Category.class);
    }

    @Transactional
    public void persist(Category record) {
        manager.persist(record);
    }

    @Transactional
    public Category findByName(final String name) {
        Query query = manager.createQuery("SELECT c from Category c where c.name =:name");
        query.setParameter("name", name);
        try {
            return (Category) query.getSingleResult();
        }catch (NoResultException e) {
            return null;
        }
    }


}

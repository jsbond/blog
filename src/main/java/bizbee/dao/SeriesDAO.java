package bizbee.dao;

import bizbee.model.Category;
import bizbee.model.Series;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.NoResultException;
import javax.persistence.Query;
import javax.persistence.TypedQuery;
import java.util.List;


@Repository
public class SeriesDAO extends AbstractDAO<Series> {

    public SeriesDAO() {
        super(Series.class);
    }

    @Transactional
    public void persist(Series record) {
        manager.persist(record);
    }

    @Transactional
    public List<Series> findAllDisabled() {
        TypedQuery<Series> query = manager.createQuery("SELECT s from Series s where s.status=0", Series.class);
        return query.getResultList();
    }

    @Transactional
    public List<Series> findAll() {
        TypedQuery<Series> query = manager.createQuery("SELECT s from Series s order by s.enabled desc", Series.class);
        return query.getResultList();
    }
}

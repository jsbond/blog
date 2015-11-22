package bizbee.dao;

import bizbee.model.Category;
import bizbee.model.Photo;
import bizbee.model.Series;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.Query;
import javax.persistence.TypedQuery;
import java.util.List;


@Repository
@Transactional
public class PhotoDAO extends AbstractDAO<Photo> {

    public PhotoDAO() {
        super(Photo.class);
    }


    public void persist(Photo record) {
        manager.persist(record);
    }

    public List<Photo> findAll() {
        TypedQuery<Photo> query = manager.createQuery("SELECT s from Photo s order by s.createdAt desc", Photo.class);
        return query.getResultList();
    }

    public List<Photo> findAllByStatus(int status) {
        TypedQuery<Photo> query = manager.createQuery("SELECT s from Photo s where s.status=:status order by s.createdAt desc", Photo.class);
        query.setParameter("status", status);
        return query.getResultList();
    }

    public Long getMaxId() {
        Query query = manager.createQuery("SELECT MAX(id) from Photo");
        return (Long) query.getSingleResult();
    }

    public List<Photo> findAllByStatusList(List<Integer> statuses) {
        TypedQuery<Photo> query = manager.createQuery("SELECT s from Photo s where s.status in (:statuses)", Photo.class);
        query.setParameter("statuses", statuses);
        return query.getResultList();
    }

    public List<Photo> findByIdList(List<Long> idList) {
        TypedQuery<Photo> query = manager.createQuery("SELECT s from Photo s where s.id in (:list)", Photo.class);
        query.setParameter("list", idList);
        return query.getResultList();
    }

    public Photo findByUrl(final String url) {
        TypedQuery<Photo> query = manager.createQuery("SELECT s from Photo s where s.url= :url ", Photo.class);
        query.setParameter("url", url);
        return query.getSingleResult();
    }
}

package bizbee.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import java.io.Serializable;

/**
 *
 */
@Entity
@Table(name = "page_interactions")
public class PageInteraction implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;

    @ManyToOne
    @JoinColumn(name = "parent_page_id")
    private Page parentPage;

    @ManyToOne
    @JoinColumn(name = "child_page_id")
    private Page childPage;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public Page getParentPage() {
        return parentPage;
    }

    public void setParentPage(Page parentPage) {
        this.parentPage = parentPage;
    }

    public Page getChildPage() {
        return childPage;
    }

    public void setChildPage(Page childPage) {
        this.childPage = childPage;
    }
}

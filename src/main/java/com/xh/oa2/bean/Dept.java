package com.xh.oa2.bean;

import java.util.Objects;

public class Dept {
	String vid;
	String name;
	String price;
	String hosts;
	String species;

	public Dept() {
	}

	public Dept(String vid, String name, String price, String hosts, String species) {
		this.vid = vid;
		this.name = name;
		this.price = price;
		this.hosts = hosts;
		this.species = species;
	}

	public String getVid() {
		return vid;
	}

	public void setVid(String vid) {
		this.vid = vid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getHosts() {
		return hosts;
	}

	public void setHosts(String hosts) {
		this.hosts = hosts;
	}

	public String getSpecies() {
		return species;
	}

	public void setSpecies(String species) {
		this.species = species;
	}

	
	  @Override public String toString() {return "Dept{" +"vid='" + vid +
	  '\'' +", name='" + name + '\'' + ", price='"+price+'\''+", hosts='"+hosts+'\''+", species='"+species + '\'' +'}';}
	  
	  @Override public boolean equals(Object o) {
		  if (this == o) return true;
		  if (o == null || getClass() != o.getClass()) return false;
		  Dept dept = (Dept)o;return Objects.equals(vid, dept.vid) && Objects.equals(name,dept.name)
				  && Objects.equals(price,dept.price)&& Objects.equals(hosts,dept.hosts)&& Objects.equals(species,dept.species);}
	  
	  @Override public int hashCode() {return Objects.hash(vid, name,price,hosts,species);}
	 
}
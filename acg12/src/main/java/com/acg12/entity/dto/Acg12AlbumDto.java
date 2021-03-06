package com.acg12.entity.dto;

public class Acg12AlbumDto {

	private String pinId = "";
	private String content; // 内容
	private String image;
	private Integer resWidth; // 资源宽度
	private Integer resHight; // 资源高度
	private Integer love; // 喜欢的个数  点赞
	private Integer favorites;// 收藏的个数 采集
	/** 是否收藏 */
	private Integer isCollect;

	public String getPinId() {
		return pinId;
	}

	public void setPinId(String pinId) {
		this.pinId = pinId;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Integer getResWidth() {
		return resWidth;
	}

	public void setResWidth(Integer resWidth) {
		this.resWidth = resWidth;
	}

	public Integer getResHight() {
		return resHight;
	}

	public void setResHight(Integer resHight) {
		this.resHight = resHight;
	}

	public Integer getLove() {
		return love;
	}

	public void setLove(Integer love) {
		this.love = love;
	}

	public Integer getFavorites() {
		return favorites;
	}

	public void setFavorites(Integer favorites) {
		this.favorites = favorites;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public Integer getIsCollect() {
		return isCollect;
	}

	public void setIsCollect(Integer isCollect) {
		this.isCollect = isCollect;
	}
}

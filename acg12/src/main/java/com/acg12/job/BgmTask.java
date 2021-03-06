package com.acg12.job;

import com.acg12.entity.dto.Acg12CharacterDto;
import com.acg12.entity.dto.Acg12PersonDto;
import com.acg12.entity.dto.Acg12SubjectDto;
import com.acg12.entity.po.Acg12CharacterEntity;
import com.acg12.entity.po.Acg12ScheduleJobLogEntity;
import com.acg12.service.Acg12ScheduleJobLogService;
import com.acg12.service.impl.Acg12CharacterServiceImpl;
import com.acg12.service.impl.Acg12PersonServiceImpl;
import com.acg12.service.impl.Acg12SubjectServiceImpl;
import com.acg12.utils.res.BgmResourceUtil;
import com.framework.loippi.utils.web.SpringUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: KCJ
 * Date: 2018/12/12 15:58
 * Description:
 */
@Component
public class BgmTask {

    public final Logger log = Logger.getLogger(this.getClass());

    public void runSubjectDto() {
//        log.debug("runSubjectDto......................................" + (new Date()));
//        log.info("runSubjectDto......................................" + (new Date()));
//        log.error("runSubjectDto......................................" + (new Date()));
        Acg12ScheduleJobLogService acg12ScheduleJobLogService = (Acg12ScheduleJobLogService) SpringUtils.getBean("acg12ScheduleJobLogServiceImpl");
        if (acg12ScheduleJobLogService == null) {
            return;
        }
        Acg12ScheduleJobLogEntity acg12ScheduleJobLogEntity = acg12ScheduleJobLogService.find("jobId", "2");
        if (acg12ScheduleJobLogEntity == null) {
            return;
        }
        acg12ScheduleJobLogEntity.setStartNum(acg12ScheduleJobLogEntity.getStartNum() + 1);
        // TODO: 失败的全部抛弃，后面查表找回
        acg12ScheduleJobLogService.update(acg12ScheduleJobLogEntity);
        Acg12SubjectDto acg12SubjectDto = BgmResourceUtil.getSubjectDto(acg12ScheduleJobLogEntity.getStartNum().intValue());
        if (acg12SubjectDto == null) {
            return;
        }
        Acg12SubjectServiceImpl acg12SubjectService = (Acg12SubjectServiceImpl) SpringUtils.getBean("acg12SubjectServiceImpl");
        if (acg12SubjectService == null) {
            return;
        }
        acg12SubjectService.savaSubjectDto(acg12SubjectDto);
        System.out.println(acg12SubjectDto.toString());
    }

    public void runPersonDto() {
        Acg12ScheduleJobLogService acg12ScheduleJobLogService = (Acg12ScheduleJobLogService) SpringUtils.getBean("acg12ScheduleJobLogServiceImpl");
        if (acg12ScheduleJobLogService == null) {
            return;
        }
        Acg12ScheduleJobLogEntity acg12ScheduleJobLogEntity = acg12ScheduleJobLogService.find("jobId", "3");
        if (acg12ScheduleJobLogEntity == null) {
            return;
        }
        acg12ScheduleJobLogEntity.setStartNum(acg12ScheduleJobLogEntity.getStartNum() + 1);
        acg12ScheduleJobLogService.update(acg12ScheduleJobLogEntity);
        Acg12PersonDto acg12PersonDto = BgmResourceUtil.getPersonDto(acg12ScheduleJobLogEntity.getStartNum().intValue());
        if (acg12PersonDto == null) {
            return;
        }
        Acg12PersonServiceImpl acg12PersonService = (Acg12PersonServiceImpl) SpringUtils.getBean("acg12PersonServiceImpl");
        if (acg12PersonService == null) {
            return;
        }
        acg12PersonService.savaPersonDto(acg12PersonDto);
        System.out.println(acg12PersonDto.toString());
    }

    public void runOtherCharacterDto() {
        Acg12CharacterServiceImpl acg12CharacterService = (Acg12CharacterServiceImpl) SpringUtils.getBean("acg12CharacterServiceImpl");
        if (acg12CharacterService == null) {
            return;
        }
        List<Integer> list = new ArrayList<>();
        List<Integer> list2 = BgmResourceUtil.characterType2();
        List<Integer> list3 = BgmResourceUtil.characterType3();
        List<Integer> list4 = BgmResourceUtil.characterType4();
        list.addAll(list2);
        list.addAll(list3);
        list.addAll(list4);

        for (Integer integer : list) {
            Acg12CharacterEntity characterEntity = acg12CharacterService.find("cId", integer.intValue());
            if (characterEntity != null) {
                continue;
            }
            Acg12CharacterDto acg12CharacterDto = BgmResourceUtil.getCharacterDto(integer.intValue());
            if (acg12CharacterDto == null) {
                return;
            }
            acg12CharacterService.savaCharacterDto(acg12CharacterDto);
        }
    }

    public void runCharacterDto() {
        Acg12ScheduleJobLogService acg12ScheduleJobLogService = (Acg12ScheduleJobLogService) SpringUtils.getBean("acg12ScheduleJobLogServiceImpl");
        if (acg12ScheduleJobLogService == null) {
            return;
        }
        Acg12ScheduleJobLogEntity acg12ScheduleJobLogEntity = acg12ScheduleJobLogService.find("jobId", "4");
        if (acg12ScheduleJobLogEntity == null) {
            return;
        }
        Acg12CharacterServiceImpl acg12CharacterService = (Acg12CharacterServiceImpl) SpringUtils.getBean("acg12CharacterServiceImpl");
        if (acg12CharacterService == null) {
            return;
        }
        acg12ScheduleJobLogEntity.setStartNum(acg12ScheduleJobLogEntity.getStartNum() + 1);
        Acg12CharacterEntity characterEntity = acg12CharacterService.find("cId", acg12ScheduleJobLogEntity.getStartNum().intValue());
        if (characterEntity != null) {
            return;
        }
        Acg12CharacterDto acg12CharacterDto = BgmResourceUtil.getCharacterDto(acg12ScheduleJobLogEntity.getStartNum().intValue());
        if (acg12CharacterDto == null) {
            return;
        }
        acg12CharacterService.savaCharacterDto(acg12CharacterDto);
        acg12ScheduleJobLogService.update(acg12ScheduleJobLogEntity);
        System.out.println(acg12CharacterDto.toString());
    }

}

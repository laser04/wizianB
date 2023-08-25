package com.wizian.admission.wizianb.service;

import com.wizian.admission.wizianb.domain.ApplicationIntroduce;
import com.wizian.admission.wizianb.repository.ApplicationIntroRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Component
@RequiredArgsConstructor
public class ApplicationIntroServiceImpl implements ApplicationIntroService{

    private final ApplicationIntroRepository applicationIntroRepository;


    @Override
    public List<ApplicationIntroduce> findItem(String rcrtNo) {
        return applicationIntroRepository.findItem(rcrtNo);
    }

    @Override
    public ApplicationIntroduce saveAnswer(ApplicationIntroduce appIntro) {

        ApplicationIntroduce aplyintro = new ApplicationIntroduce();
        aplyintro.setAplyNo(appIntro.getAplyNo());
        aplyintro.setRcrtNo(appIntro.getRcrtNo());
        aplyintro.setItemNo(appIntro.getItemNo());
        aplyintro.setAnswer(appIntro.getAnswer());
        applicationIntroRepository.saveAnswer(aplyintro);

        return aplyintro;
    }

    @Override
    public List<ApplicationIntroduce> findAnswerInfo(String aplyNo) {
        return applicationIntroRepository.findAnswerInfo(aplyNo);
    }
}

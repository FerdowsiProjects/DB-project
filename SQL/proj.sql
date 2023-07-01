-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema project
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema project
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `project` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `project` ;

-- -----------------------------------------------------
-- Table `project`.`drop_course`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `project`.`drop_course` (
  `course_did` INT NOT NULL,
  `corse_dname` VARCHAR(45) NULL DEFAULT NULL,
  `course_dgroup` INT NULL DEFAULT NULL,
  `professor_dname` VARCHAR(45) NULL DEFAULT NULL,
  `confirm` VARCHAR(45) NULL DEFAULT NULL,
  `student_student_number` INT NULL,
  `student_examination_schedule_course_eid` INT NULL,
  `student_class_schedule_course_cid` INT NULL,
  `student_educational_records_educational_records_id` INT NULL,
  PRIMARY KEY (`course_did`),
  INDEX `fk_drop_course_student1_idx` (`student_student_number` ASC, `student_examination_schedule_course_eid` ASC, `student_class_schedule_course_cid` ASC, `student_educational_records_educational_records_id` ASC) VISIBLE,
  CONSTRAINT `fk_drop_course_student1`
    FOREIGN KEY (`student_student_number` , `student_examination_schedule_course_eid` , `student_class_schedule_course_cid` , `student_educational_records_educational_records_id`)
    REFERENCES `project`.`student` (`student_number` , `examination_schedule_course_eid` , `class_schedule_course_cid` , `educational_records_educational_records_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `project`.`select_unit`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `project`.`select_unit` (
  `course_sgroup` INT NOT NULL,
  `authorized_course_name` VARCHAR(45) NULL DEFAULT NULL,
  `number_of_authorized_course` INT NULL DEFAULT NULL,
  `passed_course` VARCHAR(45) NULL DEFAULT NULL,
  `class_capacity` INT NULL DEFAULT NULL,
  `select_unit_time` INT NULL DEFAULT NULL,
  `select_unit_date` DATE NULL DEFAULT NULL,
  `student_student_number` INT NULL,
  `student_examination_schedule_course_eid` INT NULL,
  `student_class_schedule_course_cid` INT NULL,
  PRIMARY KEY (`course_sgroup`),
  INDEX `fk_select_unit_student1_idx` (`student_student_number` ASC, `student_examination_schedule_course_eid` ASC, `student_class_schedule_course_cid` ASC) VISIBLE,
  CONSTRAINT `fk_select_unit_student1`
    FOREIGN KEY (`student_student_number` , `student_examination_schedule_course_eid` , `student_class_schedule_course_cid`)
    REFERENCES `project`.`student` (`student_number` , `examination_schedule_course_eid` , `class_schedule_course_cid`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `project`.`course`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `project`.`course` (
  `course_code` INT NOT NULL,
  `number_of_course` INT NULL DEFAULT NULL,
  `faculty` VARCHAR(45) NULL DEFAULT NULL,
  `professor_coname` VARCHAR(45) NULL DEFAULT NULL,
  `course_time` INT NULL DEFAULT NULL,
  `select_unit_course_sgroup` INT NOT NULL,
  `student_student_number` INT NULL,
  `student_examination_schedule_course_eid` INT NULL,
  `student_class_schedule_course_cid` INT NULL,
  `drop_course_course_did` INT NULL,
  PRIMARY KEY (`course_code`, `select_unit_course_sgroup`),
  INDEX `fk_course_select_unit1_idx` (`select_unit_course_sgroup` ASC) VISIBLE,
  INDEX `fk_course_student1_idx` (`student_student_number` ASC, `student_examination_schedule_course_eid` ASC, `student_class_schedule_course_cid` ASC) VISIBLE,
  INDEX `fk_course_drop_course1_idx` (`drop_course_course_did` ASC) VISIBLE,
  CONSTRAINT `fk_course_drop_course1`
    FOREIGN KEY (`drop_course_course_did`)
    REFERENCES `project`.`drop_course` (`course_did`),
  CONSTRAINT `fk_course_select_unit1`
    FOREIGN KEY (`select_unit_course_sgroup`)
    REFERENCES `project`.`select_unit` (`course_sgroup`),
  CONSTRAINT `fk_course_student1`
    FOREIGN KEY (`student_student_number` , `student_examination_schedule_course_eid` , `student_class_schedule_course_cid`)
    REFERENCES `project`.`student` (`student_number` , `examination_schedule_course_eid` , `class_schedule_course_cid`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `project`.`professor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `project`.`professor` (
  `id` VARCHAR(45) NULL DEFAULT NULL,
  `course_course_code` INT NOT NULL,
  `course_select_unit_course_sgroup` INT NOT NULL,
  PRIMARY KEY (`course_course_code`, `course_select_unit_course_sgroup`),
  CONSTRAINT `fk_professor_course1`
    FOREIGN KEY (`course_course_code` , `course_select_unit_course_sgroup`)
    REFERENCES `project`.`course` (`course_code` , `select_unit_course_sgroup`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `project`.`supervisor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `project`.`supervisor` (
  `supervisor_id` INT NOT NULL,
  `supervisor_name` VARCHAR(45) NULL DEFAULT NULL,
  `room_number` INT NULL,
  `professor_course_course_code` INT NULL,
  `professor_course_select_unit_course_sgroup` INT NULL,
  PRIMARY KEY (`supervisor_id`),
  INDEX `fk_supervisor_professor1_idx` (`professor_course_course_code` ASC, `professor_course_select_unit_course_sgroup` ASC) VISIBLE,
  CONSTRAINT `fk_supervisor_professor1`
    FOREIGN KEY (`professor_course_course_code` , `professor_course_select_unit_course_sgroup`)
    REFERENCES `project`.`professor` (`course_course_code` , `course_select_unit_course_sgroup`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `project`.`educational_records`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `project`.`educational_records` (
  `educational_records_id` INT NOT NULL,
  `student_name` VARCHAR(45) NULL DEFAULT NULL,
  `grade` FLOAT NULL DEFAULT NULL,
  `supervisor_supervisor_id` INT NULL,
  PRIMARY KEY (`educational_records_id`),
  INDEX `fk_educational_records_supervisor1_idx` (`supervisor_supervisor_id` ASC) VISIBLE,
  CONSTRAINT `fk_educational_records_supervisor1`
    FOREIGN KEY (`supervisor_supervisor_id`)
    REFERENCES `project`.`supervisor` (`supervisor_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `project`.`student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `project`.`student` (
  `student_number` INT NOT NULL,
  `student_id` INT NULL DEFAULT NULL,
  `student_name` VARCHAR(45) NULL DEFAULT NULL,
  `phone_number` INT NULL DEFAULT NULL,
  `address` VARCHAR(45) NULL DEFAULT NULL,
  `Email` VARCHAR(45) NULL DEFAULT NULL,
  `financial_balance` INT NULL DEFAULT NULL,
  `GPA` FLOAT NULL DEFAULT NULL,
  `select_unit_course_sgroup` INT NULL DEFAULT NULL,
  `examination_schedule_course_eid` INT NOT NULL,
  `class_schedule_course_cid` INT NOT NULL,
  `educational_records_educational_records_id` INT NOT NULL,
  PRIMARY KEY (`student_number`, `examination_schedule_course_eid`, `class_schedule_course_cid`, `educational_records_educational_records_id`),
  INDEX `s_u_c_s_idx` (`select_unit_course_sgroup` ASC) VISIBLE,
  INDEX `fk_student_educational_records1_idx` (`educational_records_educational_records_id` ASC) VISIBLE,
  CONSTRAINT `fk_student_educational_records1`
    FOREIGN KEY (`educational_records_educational_records_id`)
    REFERENCES `project`.`educational_records` (`educational_records_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `project`.`assessment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `project`.`assessment` (
  `professor_id` INT NOT NULL,
  `professor_aname` VARCHAR(45) NULL DEFAULT NULL,
  `course_aname` VARCHAR(45) NULL DEFAULT NULL,
  `grade` INT NULL DEFAULT NULL,
  `student_student_number` INT NOT NULL,
  `student_examination_schedule_course_eid` INT NOT NULL,
  `student_class_schedule_course_cid` INT NOT NULL,
  PRIMARY KEY (`professor_id`, `student_student_number`, `student_examination_schedule_course_eid`, `student_class_schedule_course_cid`),
  INDEX `fk_assessment_student1_idx` (`student_student_number` ASC, `student_examination_schedule_course_eid` ASC, `student_class_schedule_course_cid` ASC) VISIBLE,
  CONSTRAINT `fk_assessment_student1`
    FOREIGN KEY (`student_student_number` , `student_examination_schedule_course_eid` , `student_class_schedule_course_cid`)
    REFERENCES `project`.`student` (`student_number` , `examination_schedule_course_eid` , `class_schedule_course_cid`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `project`.`book_loen`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `project`.`book_loen` (
  `reserve_bid` INT NOT NULL,
  `reserve_date` DATE NULL DEFAULT NULL,
  `return_deadline` DATE NULL DEFAULT NULL,
  `reprieve` INT NULL DEFAULT NULL,
  `financial` INT NULL DEFAULT NULL,
  `student_student_number` INT NULL,
  `student_examination_schedule_course_eid` INT NULL,
  `student_class_schedule_course_cid` INT NULL,
  `professor_course_course_code` INT NOT NULL,
  `professor_course_select_unit_course_sgroup` INT NOT NULL,
  PRIMARY KEY (`reserve_bid`),
  INDEX `fk_book_loen_student1_idx` (`student_student_number` ASC, `student_examination_schedule_course_eid` ASC, `student_class_schedule_course_cid` ASC) VISIBLE,
  INDEX `fk_book_loen_professor1_idx` (`professor_course_course_code` ASC, `professor_course_select_unit_course_sgroup` ASC) VISIBLE,
  CONSTRAINT `fk_book_loen_student1`
    FOREIGN KEY (`student_student_number` , `student_examination_schedule_course_eid` , `student_class_schedule_course_cid`)
    REFERENCES `project`.`student` (`student_number` , `examination_schedule_course_eid` , `class_schedule_course_cid`),
  CONSTRAINT `fk_book_loen_professor1`
    FOREIGN KEY (`professor_course_course_code` , `professor_course_select_unit_course_sgroup`)
    REFERENCES `project`.`professor` (`course_course_code` , `course_select_unit_course_sgroup`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `project`.`class`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `project`.`class` (
  `class_id` INT NOT NULL,
  `class_number` INT NULL DEFAULT NULL,
  `class_time` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`class_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `project`.`class_has_course`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `project`.`class_has_course` (
  `class_class_id` INT NOT NULL,
  `course_course_code` INT NOT NULL,
  `course_select_unit_course_sgroup` INT NOT NULL,
  PRIMARY KEY (`class_class_id`, `course_course_code`, `course_select_unit_course_sgroup`),
  INDEX `fk_class_has_course_course1_idx` (`course_course_code` ASC, `course_select_unit_course_sgroup` ASC) VISIBLE,
  INDEX `fk_class_has_course_class1_idx` (`class_class_id` ASC) VISIBLE,
  CONSTRAINT `fk_class_has_course_class1`
    FOREIGN KEY (`class_class_id`)
    REFERENCES `project`.`class` (`class_id`),
  CONSTRAINT `fk_class_has_course_course1`
    FOREIGN KEY (`course_course_code` , `course_select_unit_course_sgroup`)
    REFERENCES `project`.`course` (`course_code` , `select_unit_course_sgroup`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `project`.`class_schedule`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `project`.`class_schedule` (
  `course_cid` INT NOT NULL,
  `course_cname` VARCHAR(45) NULL DEFAULT NULL,
  `number_of_course` INT NULL DEFAULT NULL,
  `professor_cname` VARCHAR(45) NULL DEFAULT NULL,
  `class_number` INT NULL DEFAULT NULL,
  `class_day` VARCHAR(45) NULL DEFAULT NULL,
  `class_time` INT NULL DEFAULT NULL,
  `student_student_number` INT NOT NULL,
  `student_examination_schedule_course_eid` INT NOT NULL,
  `student_class_schedule_course_cid` INT NOT NULL,
  PRIMARY KEY (`course_cid`, `student_student_number`, `student_examination_schedule_course_eid`, `student_class_schedule_course_cid`),
  INDEX `fk_class_schedule_student1_idx` (`student_student_number` ASC, `student_examination_schedule_course_eid` ASC, `student_class_schedule_course_cid` ASC) VISIBLE,
  CONSTRAINT `fk_class_schedule_student1`
    FOREIGN KEY (`student_student_number` , `student_examination_schedule_course_eid` , `student_class_schedule_course_cid`)
    REFERENCES `project`.`student` (`student_number` , `examination_schedule_course_eid` , `class_schedule_course_cid`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `project`.`electronic_payment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `project`.`electronic_payment` (
  `pay_id` INT NOT NULL,
  `reason` VARCHAR(45) NULL DEFAULT NULL,
  `amount` INT NULL DEFAULT NULL,
  `date_of_payment` DATE NULL DEFAULT NULL,
  `time_of_payment` INT NULL DEFAULT NULL,
  `receipt_number` INT NULL DEFAULT NULL,
  `student_student_number` INT NULL DEFAULT NULL,
  PRIMARY KEY (`pay_id`),
  INDEX `student_student_number_idx` (`student_student_number` ASC) VISIBLE,
  CONSTRAINT `s_s_n`
    FOREIGN KEY (`student_student_number`)
    REFERENCES `project`.`student` (`student_number`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `project`.`examination_schedule`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `project`.`examination_schedule` (
  `course_eid` INT NOT NULL,
  `course_ename` VARCHAR(45) NULL DEFAULT NULL,
  `professor_ename` VARCHAR(45) NULL DEFAULT NULL,
  `exam_day` VARCHAR(45) NULL DEFAULT NULL,
  `exam_time` INT NULL DEFAULT NULL,
  `exam_date` DATE NULL DEFAULT NULL,
  `class` VARCHAR(45) NULL DEFAULT NULL,
  `seat_number` INT NULL DEFAULT NULL,
  `student_student_number` INT NOT NULL,
  `student_examination_schedule_course_eid` INT NOT NULL,
  `student_class_schedule_course_cid` INT NOT NULL,
  PRIMARY KEY (`course_eid`, `student_student_number`, `student_examination_schedule_course_eid`, `student_class_schedule_course_cid`),
  INDEX `fk_examination_schedule_student1_idx` (`student_student_number` ASC, `student_examination_schedule_course_eid` ASC, `student_class_schedule_course_cid` ASC) VISIBLE,
  CONSTRAINT `fk_examination_schedule_student1`
    FOREIGN KEY (`student_student_number` , `student_examination_schedule_course_eid` , `student_class_schedule_course_cid`)
    REFERENCES `project`.`student` (`student_number` , `examination_schedule_course_eid` , `class_schedule_course_cid`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `project`.`food_reservation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `project`.`food_reservation` (
  `reserve_fid` INT NOT NULL,
  `reserved` INT NULL DEFAULT NULL,
  `canceled` INT NULL DEFAULT NULL,
  `forgot` INT NULL DEFAULT NULL,
  `eaten` INT NULL DEFAULT NULL,
  `student_student_number` INT NULL,
  `student_examination_schedule_course_eid` INT NULL,
  `student_class_schedule_course_cid` INT NULL,
  `student_educational_records_educational_records_id` INT NULL,
  `professor_course_course_code` INT NOT NULL,
  `professor_course_select_unit_course_sgroup` INT NOT NULL,
  INDEX `fk_food_reservation_student1_idx` (`student_student_number` ASC, `student_examination_schedule_course_eid` ASC, `student_class_schedule_course_cid` ASC, `student_educational_records_educational_records_id` ASC) VISIBLE,
  PRIMARY KEY (`reserve_fid`),
  INDEX `fk_food_reservation_professor1_idx` (`professor_course_course_code` ASC, `professor_course_select_unit_course_sgroup` ASC) VISIBLE,
  CONSTRAINT `fk_food_reservation_student1`
    FOREIGN KEY (`student_student_number` , `student_examination_schedule_course_eid` , `student_class_schedule_course_cid` , `student_educational_records_educational_records_id`)
    REFERENCES `project`.`student` (`student_number` , `examination_schedule_course_eid` , `class_schedule_course_cid` , `educational_records_educational_records_id`),
  CONSTRAINT `fk_food_reservation_professor1`
    FOREIGN KEY (`professor_course_course_code` , `professor_course_select_unit_course_sgroup`)
    REFERENCES `project`.`professor` (`course_course_code` , `course_select_unit_course_sgroup`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `project`.`grade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `project`.`grade` (
  `grade_id` INT NOT NULL,
  `course_name` VARCHAR(45) NULL DEFAULT NULL,
  `prof_name` VARCHAR(45) NULL DEFAULT NULL,
  `student_name` VARCHAR(45) NULL DEFAULT NULL,
  `professor_professor_id` INT NOT NULL,
  `student_student_number` INT NOT NULL,
  `student_examination_schedule_course_eid` INT NOT NULL,
  `student_class_schedule_course_cid` INT NOT NULL,
  `student_educational_records_educational_records_id` INT NOT NULL,
  `select_unit_course_sgroup` INT NULL,
  PRIMARY KEY (`grade_id`, `professor_professor_id`, `student_student_number`, `student_examination_schedule_course_eid`, `student_class_schedule_course_cid`, `student_educational_records_educational_records_id`),
  INDEX `fk_grade_student1_idx` (`student_student_number` ASC, `student_examination_schedule_course_eid` ASC, `student_class_schedule_course_cid` ASC, `student_educational_records_educational_records_id` ASC) VISIBLE,
  INDEX `fk_grade_select_unit1_idx` (`select_unit_course_sgroup` ASC) VISIBLE,
  CONSTRAINT `fk_grade_student1`
    FOREIGN KEY (`student_student_number` , `student_examination_schedule_course_eid` , `student_class_schedule_course_cid` , `student_educational_records_educational_records_id`)
    REFERENCES `project`.`student` (`student_number` , `examination_schedule_course_eid` , `class_schedule_course_cid` , `educational_records_educational_records_id`),
  CONSTRAINT `fk_grade_select_unit1`
    FOREIGN KEY (`select_unit_course_sgroup`)
    REFERENCES `project`.`select_unit` (`course_sgroup`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `project`.`presence`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `project`.`presence` (
  `course_pid` INT NOT NULL,
  `course_pname` VARCHAR(45) NULL DEFAULT NULL,
  `course_group` INT NULL DEFAULT NULL,
  `professor` VARCHAR(45) NULL DEFAULT NULL,
  `number_of_sessions` INT NULL DEFAULT NULL,
  `number_of_absences` INT NULL DEFAULT NULL,
  `number_of_excused_absences` INT NULL DEFAULT NULL,
  `student_student_number` INT NOT NULL,
  `student_examination_schedule_course_eid` INT NOT NULL,
  `student_class_schedule_course_cid` INT NOT NULL,
  `course_course_code` INT NOT NULL,
  `course_select_unit_course_sgroup` INT NOT NULL,
  PRIMARY KEY (`course_pid`, `student_student_number`, `student_examination_schedule_course_eid`, `student_class_schedule_course_cid`, `course_course_code`, `course_select_unit_course_sgroup`),
  INDEX `fk_presence_student1_idx` (`student_student_number` ASC, `student_examination_schedule_course_eid` ASC, `student_class_schedule_course_cid` ASC) VISIBLE,
  INDEX `fk_presence_course1_idx` (`course_course_code` ASC, `course_select_unit_course_sgroup` ASC) VISIBLE,
  CONSTRAINT `fk_presence_student1`
    FOREIGN KEY (`student_student_number` , `student_examination_schedule_course_eid` , `student_class_schedule_course_cid`)
    REFERENCES `project`.`student` (`student_number` , `examination_schedule_course_eid` , `class_schedule_course_cid`),
  CONSTRAINT `fk_presence_course1`
    FOREIGN KEY (`course_course_code` , `course_select_unit_course_sgroup`)
    REFERENCES `project`.`course` (`course_code` , `select_unit_course_sgroup`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `project`.`report_card`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `project`.`report_card` (
  `course_number` INT NOT NULL,
  `course_rname` VARCHAR(45) NULL DEFAULT NULL,
  `number_of_corse` INT NULL DEFAULT NULL,
  `rgrade` INT NULL DEFAULT NULL,
  `rGPA` INT NULL DEFAULT NULL,
  `student_student_number` INT NOT NULL,
  `student_examination_schedule_course_eid` INT NOT NULL,
  `student_class_schedule_course_cid` INT NOT NULL,
  `supervisor_supervisor_id` INT NULL,
  PRIMARY KEY (`course_number`, `student_student_number`, `student_examination_schedule_course_eid`, `student_class_schedule_course_cid`),
  INDEX `fk_report_card_student1_idx` (`student_student_number` ASC, `student_examination_schedule_course_eid` ASC, `student_class_schedule_course_cid` ASC) VISIBLE,
  INDEX `fk_report_card_supervisor1_idx` (`supervisor_supervisor_id` ASC) VISIBLE,
  CONSTRAINT `fk_report_card_student1`
    FOREIGN KEY (`student_student_number` , `student_examination_schedule_course_eid` , `student_class_schedule_course_cid`)
    REFERENCES `project`.`student` (`student_number` , `examination_schedule_course_eid` , `class_schedule_course_cid`),
  CONSTRAINT `fk_report_card_supervisor1`
    FOREIGN KEY (`supervisor_supervisor_id`)
    REFERENCES `project`.`supervisor` (`supervisor_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `project`.`request`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `project`.`request` (
  `request_id` INT NOT NULL,
  `reason` VARCHAR(45) NULL DEFAULT NULL,
  `request_time` DATE NULL DEFAULT NULL,
  `prof_name` VARCHAR(45) NULL,
  `stu_name` VARCHAR(45) NULL,
  `status` VARCHAR(45) NULL DEFAULT NULL,
  `student_student_number` INT NULL,
  `student_examination_schedule_course_eid` INT NULL,
  `student_class_schedule_course_cid` INT NULL,
  `drop_course_course_did` INT NULL,
  PRIMARY KEY (`request_id`),
  INDEX `fk_request_student1_idx` (`student_student_number` ASC, `student_examination_schedule_course_eid` ASC, `student_class_schedule_course_cid` ASC) VISIBLE,
  INDEX `fk_request_drop_course1_idx` (`drop_course_course_did` ASC) VISIBLE,
  CONSTRAINT `fk_request_drop_course1`
    FOREIGN KEY (`drop_course_course_did`)
    REFERENCES `project`.`drop_course` (`course_did`),
  CONSTRAINT `fk_request_student1`
    FOREIGN KEY (`student_student_number` , `student_examination_schedule_course_eid` , `student_class_schedule_course_cid`)
    REFERENCES `project`.`student` (`student_number` , `examination_schedule_course_eid` , `class_schedule_course_cid`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `project`.`student_work`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `project`.`student_work` (
  `student_work_id` INT NOT NULL,
  `reason` VARCHAR(45) NULL DEFAULT NULL,
  `salary` INT NULL DEFAULT NULL,
  `work_time` INT NULL DEFAULT NULL,
  `student_student_number` INT NOT NULL,
  `student_examination_schedule_course_eid` INT NOT NULL,
  `student_class_schedule_course_cid` INT NOT NULL,
  `student_educational_records_educational_records_id` INT NOT NULL,
  PRIMARY KEY (`student_work_id`, `student_student_number`, `student_examination_schedule_course_eid`, `student_class_schedule_course_cid`, `student_educational_records_educational_records_id`),
  INDEX `fk_student_work_student1_idx` (`student_student_number` ASC, `student_examination_schedule_course_eid` ASC, `student_class_schedule_course_cid` ASC, `student_educational_records_educational_records_id` ASC) VISIBLE,
  CONSTRAINT `fk_student_work_student1`
    FOREIGN KEY (`student_student_number` , `student_examination_schedule_course_eid` , `student_class_schedule_course_cid` , `student_educational_records_educational_records_id`)
    REFERENCES `project`.`student` (`student_number` , `examination_schedule_course_eid` , `class_schedule_course_cid` , `educational_records_educational_records_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `project`.`food`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `project`.`food` (
  `food_id` INT NOT NULL,
  `food_name` VARCHAR(45) NULL,
  `price` INT NULL,
  `food_reservation_reserve_fid` INT NOT NULL,
  PRIMARY KEY (`food_id`, `food_reservation_reserve_fid`),
  INDEX `fk_food_food_reservation1_idx` (`food_reservation_reserve_fid` ASC) VISIBLE,
  CONSTRAINT `fk_food_food_reservation1`
    FOREIGN KEY (`food_reservation_reserve_fid`)
    REFERENCES `project`.`food_reservation` (`reserve_fid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `project`.`book`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `project`.`book` (
  `book_id` INT NOT NULL,
  `book_name` VARCHAR(45) NULL,
  `treasury` VARCHAR(45) NULL,
  `book_loen_reserve_bid` INT NOT NULL,
  PRIMARY KEY (`book_id`, `book_loen_reserve_bid`),
  INDEX `fk_book_book_loen1_idx` (`book_loen_reserve_bid` ASC) VISIBLE,
  CONSTRAINT `fk_book_book_loen1`
    FOREIGN KEY (`book_loen_reserve_bid`)
    REFERENCES `project`.`book_loen` (`reserve_bid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

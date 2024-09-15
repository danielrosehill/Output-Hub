from sqlalchemy import Column, Integer, String, Text, DateTime, ForeignKey, JSON
from sqlalchemy.orm import relationship
from sqlalchemy.ext.declarative import declarative_base
from datetime import datetime

Base = declarative_base()

class CustomGPT(Base):
    __tablename__ = 'custom_gpt'
    
    id = Column(Integer, primary_key=True)
    name = Column(String(100))
    link = Column(String)  # URLField equivalent
    description = Column(Text)
    config = Column(JSON)
    creation_date = Column(DateTime, default=datetime.utcnow)
    
    # Relationships
    prompt_outputs = relationship('PromptOutput', secondary='custom_gpt_prompt_output', back_populates='custom_gpts')
    activity_status_id = Column(Integer, ForeignKey('lookup_activity_status.id'))
    activity_status = relationship('LookupActivityStatus', back_populates='custom_gpts')
    agent_groups = relationship('LookupAgentGroups', secondary='custom_gpt_agent_group', back_populates='custom_gpts')
    gpt_model_id = Column(Integer, ForeignKey('lookup_gpt_models.id'))
    gpt_model = relationship('LookupGptModels', back_populates='custom_gpts')
    output_reviews_done = relationship('LookupGptOutputReviewsDone', secondary='custom_gpt_output_reviews_done', back_populates='custom_gpts')
    gpt_rating_id = Column(Integer, ForeignKey('lookup_gpt_rating.id'))
    gpt_rating = relationship('LookupGptRating', back_populates='custom_gpts')
    response_time_id = Column(Integer, ForeignKey('lookup_gpt_response_times.id'))
    response_time = relationship('LookupGptResponseTimes', back_populates='custom_gpts')
    gpt_cats = relationship('LookupGptCats', secondary='custom_gpt_cat', back_populates='custom_gpts')
    llm_list_id = Column(Integer, ForeignKey('lookup_llm_list.id'))
    llm_list = relationship('LookupLlmList', back_populates='custom_gpts')
    project_tags = relationship('LookupProjectTags', secondary='custom_gpt_project_tag', back_populates='custom_gpts')

    def __repr__(self):
        return f"<CustomGPT(name={self.name})>"

# Create a table for many-to-many relationships
class CustomGptPromptOutput(Base):
    __tablename__ = 'custom_gpt_prompt_output'
    custom_gpt_id = Column(Integer, ForeignKey('custom_gpt.id'), primary_key=True)
    prompt_output_id = Column(Integer, ForeignKey('prompt_output.id'), primary_key=True)

class CustomGptAgentGroup(Base):
    __tablename__ = 'custom_gpt_agent_group'
    custom_gpt_id = Column(Integer, ForeignKey('custom_gpt.id'), primary_key=True)
    agent_group_id = Column(Integer, ForeignKey('lookup_agent_groups.id'), primary_key=True)

class CustomGptOutputReviewsDone(Base):
    __tablename__ = 'custom_gpt_output_reviews_done'
    custom_gpt_id = Column(Integer, ForeignKey('custom_gpt.id'), primary_key=True)
    output_reviews_done_id = Column(Integer, ForeignKey('lookup_gpt_output_reviews_done.id'), primary_key=True)

class CustomGptCat(Base):
    __tablename__ = 'custom_gpt_cat'
    custom_gpt_id = Column(Integer, ForeignKey('custom_gpt.id'), primary_key=True)
    gpt_cat_id = Column(Integer, ForeignKey('lookup_gpt_cats.id'), primary_key=True)

class CustomGptProjectTag(Base):
    __tablename__ = 'custom_gpt_project_tag'
    custom_gpt_id = Column(Integer, ForeignKey('custom_gpt.id'), primary_key=True)
    project_tag_id = Column(Integer, ForeignKey('lookup_project_tags.id'), primary_key=True)

class PromptLibrary(Base):
    __tablename__ = 'prompt_library'
    
    id = Column(Integer, primary_key=True)
    prompt_name = Column(String(100))
    prompt_text = Column(Text)
    prompt_dev_stage_id = Column(Integer, ForeignKey('lookup_prompt_dev_stages.id'))
    prompt_dev_stage = relationship('LookupPromptDevStages', back_populates='prompt_libraries')
    project_tags = relationship('LookupProjectTags', secondary='prompt_library_project_tag', back_populates='prompt_libraries')

    def __repr__(self):
        return f"<PromptLibrary(prompt_name={self.prompt_name})>"

class PromptLibraryProjectTag(Base):
    __tablename__ = 'prompt_library_project_tag'
    prompt_library_id = Column(Integer, ForeignKey('prompt_library.id'), primary_key=True)
    project_tag_id = Column(Integer, ForeignKey('lookup_project_tags.id'), primary_key=True)

class OutputTag(Base):
    __tablename__ = 'output_tag'
    
    id = Column(Integer, primary_key=True)
    tag_name = Column(String(100))
    created = Column(DateTime, default=datetime.utcnow)

    def __repr__(self):
        return f"<OutputTag(tag_name={self.tag_name})>"

class LookupAccuracyLevel(Base):
    __tablename__ = 'lookup_accuracy_level'
    
    id = Column(Integer, primary_key=True)
    level = Column(String(100))
    description = Column(Text)

    def __repr__(self):
        return f"<LookupAccuracyLevel(level={self.level})>"

class LookupActionabilityLevel(Base):
    __tablename__ = 'lookup_actionability_level'
    
    id = Column(Integer, primary_key=True)
    level_name = Column(String(100))
    description = Column(Text)

    def __repr__(self):
        return f"<LookupActionabilityLevel(level_name={self.level_name})>"

class LookupActivityStatus(Base):
    __tablename__ = 'lookup_activity_status'
    
    id = Column(Integer, primary_key=True)
    status_name = Column(String(100))
    description = Column(Text)
    
    custom_gpts = relationship('CustomGPT', back_populates='activity_status')

    def __repr__(self):
        return f"<LookupActivityStatus(status_name={self.status_name})>"

class LookupAgentGroups(Base):
    __tablename__ = 'lookup_agent_groups'
    
    id = Column(Integer, primary_key=True)
    group_name = Column(String(100))
    group_description = Column(Text)
    
    custom_gpts = relationship('CustomGPT', secondary='custom_gpt_agent_group', back_populates='agent_groups')

    def __repr__(self):
        return f"<LookupAgentGroups(group_name={self.group_name})>"

class LookupGptModels(Base):
    __tablename__ = 'lookup_gpt_models'
    
    id = Column(Integer, primary_key=True)
    model_name = Column(String(100))
    model_description = Column(Text)
    
    custom_gpts = relationship('CustomGPT', back_populates='gpt_model')

    def __repr__(self):
        return f"<LookupGptModels(model_name={self.model_name})>"

class LookupGptOutputReviewsDone(Base):
    __tablename__ = 'lookup_gpt_output_reviews_done'
    
    id = Column(Integer, primary_key=True)
    review_name = Column(String(100))
    review_desc = Column(Text)
    
    custom_gpts = relationship('CustomGPT', secondary='custom_gpt_output_reviews_done', back_populates='output_reviews_done')

    def __repr__(self):
        return f"<LookupGptOutputReviewsDone(review_name={self.review_name})>"

class LookupGptRating(Base):
    __tablename__ = 'lookup_gpt_rating'
    
    id = Column(Integer, primary_key=True)
    rating = Column(Integer)
    rating_description = Column(Text)
    
    custom_gpts = relationship('CustomGPT', back_populates='gpt_rating')

    def __repr__(self):
        return f"<LookupGptRating(rating={self.rating})>"

class LookupGptResponseTimes(Base):
    __tablename__ = 'lookup_gpt_response_times'
    
    id = Column(Integer, primary_key=True)
    response_time = Column(String(100))
    min_value = Column(Integer)
    max_value = Column(Integer)
    description = Column(Text)
    
    custom_gpts = relationship('CustomGPT', back_populates='response_time')

    def __repr__(self):
        return f"<LookupGptResponseTimes(response_time={self.response_time})>"

class LookupGptCats(Base):
    __tablename__ = 'lookup_gpt_cats'
    
    id = Column(Integer, primary_key=True)
    cat_name = Column(String(100))
    cat_desc = Column(Text)
    created_at = Column(DateTime, default=datetime.utcnow)
    
    custom_gpts = relationship('CustomGPT', secondary='custom_gpt_cat', back_populates='gpt_cats')

    def __repr__(self):
        return f"<LookupGptCats(cat_name={self.cat_name})>"

class LookupKnowledgeTypes(Base):
    __tablename__ = 'lookup_knowledge_types'
    
    id = Column(Integer, primary_key=True)
    name = Column(String(100))
    description = Column(Text)

    def __repr__(self):
        return f"<LookupKnowledgeTypes(name={self.name})>"

class LookupLlmList(Base):
    __tablename__ = 'lookup_llm_list'
    
    id = Column(Integer, primary_key=True)
    llm_name = Column(String(100))
    llm_desc = Column(Text)
    year_released = Column(Integer)
    
    custom_gpts = relationship('CustomGPT', back_populates='llm_list')

    def __repr__(self):
        return f"<LookupLlmList(llm_name={self.llm_name})>"

class LookupMdConversionStatus(Base):
    __tablename__ = 'lookup_md_conversion_status'
    
    id = Column(Integer, primary_key=True)
    status_name = Column(String(100))

    def __repr__(self):
        return f"<LookupMdConversionStatus(status_name={self.status_name})>"

class LookupMediaTypes(Base):
    __tablename__ = 'lookup_media_types'
    
    id = Column(Integer, primary_key=True)
    name = Column(String(100))
    description = Column(Text)

    def __repr__(self):
        return f"<LookupMediaTypes(name={self.name})>"

class LookupProjectTags(Base):
    __tablename__ = 'lookup_project_tags'
    
    id = Column(Integer, primary_key=True)
    tag_name = Column(String(100))
    tag_desc = Column(Text)
    
    custom_gpts = relationship('CustomGPT', secondary='custom_gpt_project_tag', back_populates='project_tags')
    prompt_libraries = relationship('PromptLibrary', secondary='prompt_library_project_tag', back_populates='project_tags')
    prompt_outputs = relationship('PromptOutput', secondary='prompt_output_project_tag', back_populates='project_tags')

    def __repr__(self):
        return f"<LookupProjectTags(tag_name={self.tag_name})>"

class LookupPromptDevStages(Base):
    __tablename__ = 'lookup_prompt_dev_stages'
    
    id = Column(Integer, primary_key=True)
    stage_name = Column(String(100))
    stage_desc = Column(Text)
    
    prompt_libraries = relationship('PromptLibrary', back_populates='prompt_dev_stage')

    def __repr__(self):
        return f"<LookupPromptDevStages(stage_name={self.stage_name})>"

class PromptOutput(Base):
    __tablename__ = 'prompt_output'
    
    id = Column(Integer, primary_key=True)
    date = Column(DateTime, default=datetime.utcnow)
    summary = Column(Text)
    full_output = Column(Text)
    notes = Column(Text)
    prompt_id = Column(Integer, ForeignKey('prompt_library.id'))
    prompt = relationship('PromptLibrary', back_populates='prompt_outputs')
    tags = relationship('OutputTag', secondary='prompt_output_tag', back_populates='prompt_outputs')
    accuracy_level_id = Column(Integer, ForeignKey('lookup_accuracy_level.id'))
    accuracy_level = relationship('LookupAccuracyLevel', back_populates='prompt_outputs')
    actionability_level_id = Column(Integer, ForeignKey('lookup_actionability_level.id'))
    actionability_level = relationship('LookupActionabilityLevel', back_populates='prompt_outputs')
    knowledge_types = relationship('LookupKnowledgeTypes', secondary='prompt_output_knowledge_type', back_populates='prompt_outputs')
    llm_list_id = Column(Integer, ForeignKey('lookup_llm_list.id'))
    llm_list = relationship('LookupLlmList', back_populates='prompt_outputs')
    md_conversion_status_id = Column(Integer, ForeignKey('lookup_md_conversion_status.id'))
    md_conversion_status = relationship('LookupMdConversionStatus', back_populates='prompt_outputs')
    media_types = relationship('LookupMediaTypes', secondary='prompt_output_media_type', back_populates='prompt_outputs')
    project_tags = relationship('LookupProjectTags', secondary='prompt_output_project_tag', back_populates='prompt_outputs')

    def __repr__(self):
        return f"<PromptOutput(summary={self.summary})>"

# Many-to-Many Relationship Tables for PromptOutput
class PromptOutputTag(Base):
    __tablename__ = 'prompt_output_tag'
    prompt_output_id = Column(Integer, ForeignKey('prompt_output.id'), primary_key=True)
    tag_id = Column(Integer, ForeignKey('output_tag.id'), primary_key=True)

class PromptOutputKnowledgeType(Base):
    __tablename__ = 'prompt_output_knowledge_type'
    prompt_output_id = Column(Integer, ForeignKey('prompt_output.id'), primary_key=True)
    knowledge_type_id = Column(Integer, ForeignKey('lookup_knowledge_types.id'), primary_key=True)

class PromptOutputMediaType(Base):
    __tablename__ = 'prompt_output_media_type'
    prompt_output_id = Column(Integer, ForeignKey('prompt_output.id'), primary_key=True)
    media_type_id = Column(Integer, ForeignKey('lookup_media_types.id'), primary_key=True)

class PromptOutputProjectTag(Base):
    __tablename__ = 'prompt_output_project_tag'
    prompt_output_id = Column(Integer, ForeignKey('prompt_output.id'), primary_key=True)
    project_tag_id = Column(Integer, ForeignKey('lookup_project_tags.id'), primary_key=True)

class AccessUI(Base):
    __tablename__ = 'access_ui'
    
    id = Column(Integer, primary_key=True)
    ui_name = Column(String(100))
    custom_gpt_id = Column(Integer, ForeignKey('custom_gpt.id'))
    custom_gpt = relationship('CustomGPT', back_populates='access_uis')

    def __repr__(self):
        return f"<AccessUI(ui_name={self.ui_name})>"
